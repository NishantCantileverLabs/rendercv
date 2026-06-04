"""Adopt a Typst prototype file as a RenderCV theme.

Extracts the structure from a Typst file annotated with comment markers and
generates the Jinja2 template files plus ``__init__.py`` for a custom theme.

Usage:
    rendercv adopt-template mytheme --prototype my-template.typ
"""

import pathlib
import re
import textwrap
from typing import Annotated

import rich.panel
import typer
from rich import print

from rendercv.exception import RenderCVUserError
from rendercv.schema.models.design.design import custom_theme_name_pattern

from ..app import app
from ..copy_templates import copy_templates
from ..error_handler import handle_user_errors

# ── Comment marker regexes ─────────────────────────────────────────────
TEMPLATE_MARKER = re.compile(r"^\s*//\s*@template\s+(\w+)\s*$")
ENTRY_MARKER = re.compile(r"^\s*//\s*@entry\s+(\w+)\s*$")
REGION_END_MARKER = re.compile(r"^\s*//\s*@end\s*$")
LOOP_START_MARKER = re.compile(r"^\s*//\s*@for\s+(.+)\s+in\s+(.+)$")
LOOP_END_MARKER = re.compile(r"^\s*//\s*@endfor\s*$")
IF_START_MARKER = re.compile(r"^\s*//\s*@if\s+(.+)$")
IF_END_MARKER = re.compile(r"^\s*//\s*@endif\s*$")

# ── Header substitution patterns ───────────────────────────────────────
# Match = Some Name → replace the name part
HEADER_NAME_RE = re.compile(r"^(\s*)=\s+(.+)$")
# Match #headline(Some text) → replace the content
HEADER_HEADLINE_RE = re.compile(r"^(\s*)#headline\((.+)\)$")
# Match any [content] in connections block inside a for loop
CONNECTION_ITEM_RE = re.compile(r"^(\s*)\[(.+)\],?\s*$")

# ── SectionBeginning pattern ──────────────────────────────────────────
SECTION_TITLE_RE = re.compile(r"^(\s*)==\s+(.+)$")

# ── Entry type field mappings ─────────────────────────────────────────
# For each entry type with a function wrapper:
#   "args" is a list of (key, field_ref) where:
#     - key is int for positional arg index, or str for named arg
#     - field_ref is the {{ }} reference (without the braces)
ENTRY_FUNCTION_MAP: dict[str, dict] = {
    "EducationEntry": {
        "function": "#education-entry",
        "args": [
            (0, "entry.main_column"),
            (1, "entry.date_and_location_column"),
            ("degree-column", "entry.degree_column"),
        ],
    },
    "ExperienceEntry": {
        "function": "#regular-entry",
        "args": [
            (0, "entry.main_column"),
            (1, "entry.date_and_location_column"),
        ],
    },
    "NormalEntry": {
        "function": "#regular-entry",
        "args": [
            (0, "entry.main_column"),
            (1, "entry.date_and_location_column"),
        ],
    },
    "PublicationEntry": {
        "function": "#regular-entry",
        "args": [
            (0, "entry.main_column"),
            (1, "entry.date_and_location_column"),
        ],
    },
}

# Entry types with simple inline content (no function wrapper)
INLINE_ENTRY_TEMPLATES: dict[str, str] = {
    "OneLineEntry": "{{ entry.main_column }}",
    "BulletEntry": "- {{ entry.bullet }}",
    "NumberedEntry": "+ {{ entry.number }}",
    "ReversedNumberedEntry": "+ {{ entry.reversed_number }}",
    "TextEntry": "{{ entry }}",
}

# Output filenames
TEMPLATE_FILENAMES: dict[str, str] = {
    "Preamble": "Preamble.j2.typ",
    "Header": "Header.j2.typ",
    "SectionBeginning": "SectionBeginning.j2.typ",
    "SectionEnding": "SectionEnding.j2.typ",
}


def transform_header(lines: list[str]) -> list[str]:
    """Apply automatic variable substitution to a Header template region."""
    result: list[str] = []
    for line in lines:
        m = HEADER_NAME_RE.match(line)
        if m:
            result.append(m.group(1) + "= {{ cv.name }}")
            continue

        m = HEADER_HEADLINE_RE.match(line)
        if m:
            result.append(m.group(1) + "#headline({{ cv.headline }})")
            continue

        m = CONNECTION_ITEM_RE.match(line)
        if m:
            result.append(m.group(1) + "[{{ connection }}],")
            continue

        result.append(line)
    return result


def transform_section_beginning(lines: list[str]) -> list[str]:
    """Apply automatic variable substitution to SectionBeginning."""
    result: list[str] = []
    for line in lines:
        m = SECTION_TITLE_RE.match(line)
        if m:
            result.append(m.group(1) + "== {{ section_title }}")
            continue
        result.append(line)
    return result


def transform_entry_block(lines: list[str], entry_type: str) -> list[str]:
    """Apply automatic variable substitution to an entry type template block.

    Handles two styles:
    1. Function-wrapper entries (education-entry, regular-entry, etc.)
    2. Inline entries (OneLineEntry, BulletEntry, etc.)
    """
    if entry_type in INLINE_ENTRY_TEMPLATES:
        return [INLINE_ENTRY_TEMPLATES[entry_type]]

    if entry_type not in ENTRY_FUNCTION_MAP:
        # Unknown entry type — pass through as-is
        return lines

    info = ENTRY_FUNCTION_MAP[entry_type]
    func_name = info["function"]
    arg_spec = info["args"]

    # Find the function call line
    func_line_idx = None
    for i, line in enumerate(lines):
        if func_name in line:
            func_line_idx = i
            break

    if func_line_idx is None:
        # Function not found — return lines as-is
        return lines

    result: list[str] = []
    current_pos_arg = 0

    for i, line in enumerate(lines):
        if i == func_line_idx:
            # This is the function call line — write it as-is (contains function name)
            result.append(line)
            continue

        if i < func_line_idx:
            result.append(line)
            continue

        # We're inside the function arguments
        # Check for named arg: `degree-column: [...]`
        named_arg_match = re.match(r"^(\s*)([\w-]+):\s*(\[.*)$", line)
        if named_arg_match:
            indent = named_arg_match.group(1)
            arg_name = named_arg_match.group(2)
            # Find matching field
            for key, field_ref in arg_spec:
                if isinstance(key, str) and key == arg_name:
                    result.append(indent + arg_name + ": [{{ " + field_ref + " }}],")
                    break
            else:
                result.append(line)
            continue

        # Check for positional arg: `[content],` or `[content]`
        bracket_match = re.match(r"^(\s*)\[(.*)\],?\s*$", line)
        if bracket_match:
            indent = bracket_match.group(1)
            # Find the next positional arg
            for key, field_ref in arg_spec:
                if isinstance(key, int) and key == current_pos_arg:
                    result.append(indent + "[{{ " + field_ref + " }}],")
                    current_pos_arg += 1
                    break
            else:
                result.append(line)
            continue

        result.append(line)

    return result


def preprocess_markers(lines: list[str]) -> list[str]:
    """Convert comment markers (``// @for``, ``// @if``) to Jinja2 syntax.

    This is a line-by-line pass that handles simple markers. Markers that
    span multiple lines (``// @for`` … ``// @endfor``) are handled by
    converting each marker independently.
    """
    result: list[str] = []
    for line in lines:
        m = LOOP_START_MARKER.match(line)
        if m:
            var_name = m.group(1).strip()
            iterable = m.group(2).strip()
            result.append("{% for " + var_name + " in " + iterable + " %}")
            continue

        if LOOP_END_MARKER.match(line):
            result.append("{% endfor %}")
            continue

        m = IF_START_MARKER.match(line)
        if m:
            condition = m.group(1).strip()
            result.append("{% if " + condition + " %}")
            continue

        if IF_END_MARKER.match(line):
            result.append("{% endif %}")
            continue

        # Skip @var annotations (handled by context-aware transform)
        if re.match(r"^\s*//\s*@var\s+\S+\s*$", line):
            continue

        result.append(line)
    return result


def parse_prototype(source: str) -> dict[str, list[str]]:
    """Split a Typst prototype file into named regions.

    Returns a dict mapping region names (``Header``, ``EducationEntry``,
    etc.) to their list of processed content lines.
    """
    lines = source.splitlines()
    lines = preprocess_markers(lines)

    regions: dict[str, list[str]] = {}
    current_name: str | None = None
    current_lines: list[str] = []

    for line in lines:
        m = TEMPLATE_MARKER.match(line)
        if m:
            if current_name is not None:
                regions[current_name] = current_lines
            current_name = m.group(1)
            current_lines = []
            continue

        m = ENTRY_MARKER.match(line)
        if m:
            if current_name is not None:
                regions[current_name] = current_lines
            current_name = m.group(1)
            current_lines = []
            continue

        if REGION_END_MARKER.match(line):
            if current_name is not None:
                regions[current_name] = current_lines
            current_name = None
            current_lines = []
            continue

        current_lines.append(line)

    if current_name is not None:
        regions[current_name] = current_lines

    return regions


def transform_region(name: str, lines: list[str]) -> list[str]:
    """Apply context-aware transformations to a region's lines.

    Args:
        name: Region name (e.g. ``Header``, ``EducationEntry``).
        lines: Region content lines (with Jinja2 constructs).

    Returns:
        Transformed lines suitable for writing as a ``.j2.typ`` file.
    """
    if name == "Header":
        return transform_header(lines)
    if name == "SectionBeginning":
        return transform_section_beginning(lines)
    if name in ("SectionEnding", "Preamble"):
        return lines
    if name in ENTRY_FUNCTION_MAP or name in INLINE_ENTRY_TEMPLATES:
        return transform_entry_block(lines, name)
    return lines


def generate_init_py(theme_name: str, output_path: pathlib.Path) -> None:
    """Generate a minimal ``__init__.py`` for a custom theme.

    Creates a Pydantic model class based on the theme name. If a design
    YAML file is also provided, richer defaults could be embedded.
    """
    content = textwrap.dedent(f"""\
    from rendercv.schema.models.design.classic_theme import ClassicTheme


    class {theme_name.capitalize()}Theme(ClassicTheme):
        theme: str = "{theme_name}"
    """)
    output_path.write_text(content, encoding="utf-8")


def write_region_file(
    output_dir: pathlib.Path,
    filename: str,
    lines: list[str],
) -> None:
    """Write a region's transformed lines to a Jinja2 template file."""
    content = "\n".join(lines)
    if content:
        content = content.rstrip("\n") + "\n"
    (output_dir / filename).write_text(content, encoding="utf-8")


# ── CLI command ────────────────────────────────────────────────────────


@app.command(
    name="adopt-template",
    help=(
        "Create a custom theme from a Typst prototype file with comment markers."
        " Example: [yellow]rendercv adopt-template mytheme --prototype typst-template.typ"
        "[/yellow]. Details: [cyan]rendercv adopt-template --help[/cyan]"
    ),
)
@handle_user_errors
def cli_command_adopt_template(
    theme_name: Annotated[
        str,
        typer.Argument(help="The name of the new theme"),
    ],
    prototype: Annotated[
        pathlib.Path | None,
        typer.Option(
            "--prototype",
            "-p",
            help="Path to the Typst prototype file with comments",
            exists=True,
            file_okay=True,
            dir_okay=False,
        ),
    ] = None,
) -> None:
    """Create a custom RenderCV theme from a Typst prototype file.

    The prototype file uses comment markers (``// @template``, ``// @entry``,
    ``// @for``, ``// @if``) to define the template structure. Sample data
    values are automatically replaced with Jinja2 variable references.
    """
    # Validate theme name
    if not custom_theme_name_pattern.match(theme_name):
        message = (
            "The custom theme name should only contain lowercase letters and digits."
            f" The provided value is `{theme_name}`."
        )
        raise RenderCVUserError(message)

    theme_root = pathlib.Path.cwd() / theme_name
    if theme_root.exists():
        message = f'The theme folder "{theme_name}" already exists!'
        raise RenderCVUserError(message)

    # Read the prototype file
    if prototype is None:
        message = "A prototype Typst file is required. Use --prototype to specify it."
        raise RenderCVUserError(message)

    prototype_source = prototype.read_text(encoding="utf-8")

    # Parse into regions
    regions = parse_prototype(prototype_source)

    if not regions:
        message = (
            "The prototype file does not contain any recognized regions. "
            "Add at least one // @template <name> or // @entry <EntryType> marker."
        )
        raise RenderCVUserError(message)

    # Copy all built-in templates as a starting point
    copy_templates("typst", theme_root)

    # Create entries directory if needed
    entries_dir = theme_root / "entries"

    # Track which regions were provided in the prototype
    provided_templates = set()
    provided_entries = set()

    known_entries = ENTRY_FUNCTION_MAP | INLINE_ENTRY_TEMPLATES

    for name, lines in regions.items():
        if name in TEMPLATE_FILENAMES:
            provided_templates.add(name)
            output_lines = transform_region(name, lines)
            write_region_file(theme_root, TEMPLATE_FILENAMES[name], output_lines)
        elif name in known_entries:
            provided_entries.add(name)
            output_lines = transform_region(name, lines)
            write_region_file(entries_dir, name + ".j2.typ", output_lines)
        else:
            filename = name + ".j2.typ"
            write_region_file(theme_root, filename, transform_region(name, lines))

    # Generate __init__.py
    init_file = theme_root / "__init__.py"
    generate_init_py(theme_name, init_file)

    # Summary message
    parts: list[str] = []
    if provided_templates:
        parts.append("Templates: " + ", ".join(sorted(provided_templates)))
    if provided_entries:
        parts.append("Entries: " + ", ".join(sorted(provided_entries)))

    summary = "\n".join(parts)

    message = textwrap.dedent(f"""
        [green]✓[/green] Created custom theme: [purple]./{theme_name}[/purple]

        {summary}

        To use your theme, set in your YAML input file:
        [cyan]  design:
        [cyan]    theme: {theme_name}
    """).strip("\n")

    print(
        rich.panel.Panel(
            message,
            title="Theme created from prototype",
            title_align="left",
            border_style="bright_black",
        )
    )
