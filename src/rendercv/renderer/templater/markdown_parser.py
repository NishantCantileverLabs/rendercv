import itertools
import re
from xml.etree.ElementTree import Element

import markdown
import markdown.core


def to_typst_string(elem: Element, depth: int = 0) -> str:
    """Recursively convert XML Element tree to Typst markup string.

    Why:
        Python Markdown library outputs XML Element tree. Typst requires its
        own markup syntax for bold, italic, links, etc. Recursive traversal
        converts entire element tree including nested formatting.

    Args:
        elem: XML Element from Markdown parser.
        depth: Current nesting depth (used for nested lists).

    Returns:
        Typst-formatted string.
    """
    result = []

    # Handle the element's text content
    if elem.text:
        result.append(escape_typst_characters(elem.text))

    # Process child elements
    for child in elem:
        child_content = render_child(child, depth)
        result.append(child_content)

        # Handle tail text (text after the closing tag of child)
        if child.tail:
            result.append(escape_typst_characters(child.tail))

    return "".join(result)


def render_child(child: Element, depth: int = 0) -> str:
    """Convert a single child Element to Typst markup.

    Args:
        child: XML Element to convert.
        depth: Current nesting depth (used for nested lists).

    Returns:
        Typst-formatted string for the child element.
    """
    match child.tag:
        case "strong":
            # Bold: **text** -> #strong[text]
            return f"#strong[{to_typst_string(child, depth)}]"

        case "em":
            # Italic: *text* -> #emph[text]
            return f"#emph[{to_typst_string(child, depth)}]"

        case "code":
            # Inline code: `text` -> `text`. Code blocks contain newlines
            # that are invalid inside Typst inline code, so collapse them.
            code_text = (child.text or "").replace("\n", " ").strip()
            return f"`{code_text}`"

        case "a":
            # Link: [text](url) -> #link("url")[text]
            href = child.get("href")
            if not href:
                # No URL (e.g. [text]()): render the inner content only.
                return to_typst_string(child, depth)
            # Double quotes must be escaped inside the Typst string.
            escaped_href = href.replace('"', '\\"')
            return f'#link("{escaped_href}")[{to_typst_string(child, depth)}]'

        case "div":
            # Admonition block: <div class="admonition"> -> #summary[...]
            return (
                "#summary["
                + to_typst_string(child, depth).strip("\n").replace("\n", " \\ ")
                + "]"
            )

        case "blockquote":
            # Blockquote: > text -> #quote[text]
            return f"#quote[{to_typst_string(child, depth).strip()}]"

        case "ul" | "ol":
            # List -> Typst list items, preserving nesting.
            return render_list(child, depth)

        case "br":
            # Hard line break -> newline
            return "\n"

        case _:
            if getattr(child, "attrib", {}).get("class") == "admonition-title":
                return ""
            return to_typst_string(child, depth)


def render_list(elem: Element, depth: int = 0) -> str:
    """Convert a Markdown <ul> or <ol> element into Typst list markup.

    Typst has no ordered-list syntax, so ordered items keep their number as
    plain text. Nested lists are indented so Typst renders them as sublists.

    Args:
        elem: <ul> or <ol> XML Element.
        depth: Nesting depth (each level adds two spaces of indentation).

    Returns:
        Typst list markup string.
    """
    lines = []
    for index, item in enumerate(elem):
        if item.tag != "li":
            continue
        inner = render_list_item(item, depth)
        prefix = f"{index + 1}. " if elem.tag == "ol" else "- "
        lines.append(f"{'  ' * depth}{prefix}{inner}")
    return "\n".join(lines)


def render_list_item(item: Element, depth: int) -> str:
    """Render the contents of a single <li>, including any nested lists.

    Args:
        item: <li> XML Element.
        depth: Nesting depth of this list item.

    Returns:
        Typst markup string for the list item content.
    """
    result = []
    if item.text:
        result.append(escape_typst_characters(item.text))
    for child in item:
        if child.tag in ("ul", "ol"):
            result.append("\n" + render_list(child, depth + 1))
        else:
            result.append(render_child(child, depth))
        if child.tail:
            result.append(escape_typst_characters(child.tail))
    return "".join(result)


class ListIndentationPreprocessor(markdown.preprocessors.Preprocessor):
    """Normalize list-item indentation to multiples of four spaces.

    Why:
        python-markdown only nests sublists that are indented by four spaces,
        while many authors use two-space indentation (as CommonMark does).
        Rounding the indentation of list-marker lines up to a multiple of four
        makes those sublists nest correctly.
    """

    def run(self, lines: list[str]) -> list[str]:
        result = []
        for line in lines:
            stripped = line.lstrip(" ")
            if re.match(r"^(?:[-+*]|\d+\.)\s", stripped):
                indent = len(line) - len(stripped)
                if indent % 4:
                    indent = (indent // 4 + 1) * 4
                    result.append(" " * indent + stripped)
                    continue
            result.append(line)
        return result


typst_command_pattern = re.compile(r"#([A-Za-z][^\s()\[]*)(\([^)]*\))?(\[[^\]]*\])?")
math_pattern = re.compile(r"(\$\$.*?\$\$|\$[^$\n]+?\$)")


def escape_typst_characters(string: str) -> str:
    """Escape Typst special characters while preserving commands, math, etc.

    Why:
        User content may contain Typst special characters like `#`, `$`, `[` that
        would break compilation. Escaping prevents interpretation as commands.
        Existing Typst commands and math must remain unescaped.

    Args:
        string: Text to escape.

    Returns:
        Escaped string safe for Typst.
    """
    if string == "\n":
        return string

    # Find all the Typst commands and math (both `$$...$$` blocks and `$...$`
    # inline math), and keep them separate so that nothing inside them is
    # escaped. A bare `#word` without arguments is a prose hashtag, not a Typst
    # command, so it is left to be escaped normally.
    typst_command_mapping = {}
    for i, match in enumerate(
        itertools.chain(
            math_pattern.finditer(string),
            typst_command_pattern.finditer(string),
        )
    ):
        matched = match.group(0)
        if matched.startswith("$") or match.group(2) or match.group(3):
            dummy_name = f"RENDERCVTYPSTCOMMANDORMATH{i}"
            typst_command_mapping[dummy_name] = matched
            string = string.replace(matched, dummy_name)
            typst_command_mapping[dummy_name] = typst_command_mapping[
                dummy_name
            ].replace("$$", "$")

    # Add the tail after the last match
    escape_dictionary = {
        "[": "\\[",
        "]": "\\]",
        "\\": "\\\\",
        '"': '\\"',
        "#": "\\#",
        "$": "\\$",
        "@": "\\@",
        "%": "\\%",
        "~": "\\~",
        "_": "\\_",
        "/": "\\/",
        ">": "\\>",
        "<": "\\<",
    }

    string = string.translate(str.maketrans(escape_dictionary))

    # string.translate() only supports single-character replacements, so we need to
    # handle the longer replacements separately.
    longer_escape_dictionary = {
        "* ": "#sym.ast.basic ",
        "*": "#sym.ast.basic#h(0pt, weak: true) ",
    }
    for key, value in longer_escape_dictionary.items():
        string = string.replace(key, value)

    # Replace the dummy names with the full Typst commands
    for dummy_name, full_command in typst_command_mapping.items():
        string = string.replace(dummy_name, full_command)

    return string


# Create a Markdown instance
md = markdown.core.Markdown(extensions=["admonition"])
md.output_formats["typst"] = to_typst_string  # pyright: ignore[reportArgumentType]
md.set_output_format("typst")  # pyright: ignore[reportArgumentType]
md.parser.blockprocessors.deregister("hashheader")
md.parser.blockprocessors.deregister("setextheader")
md.preprocessors.register(ListIndentationPreprocessor(md), "list-indentation", 20)
md.stripTopLevelTags = False


def markdown_to_typst(markdown_string: str) -> str:
    """Convert Markdown string to Typst markup.

    Why:
        Users write content in Markdown for readability. Typst compilation
        requires Typst markup. Consecutive non-blank lines are grouped into
        paragraphs so that emphasis markers can span lines, while lines in
        different paragraphs stay independent so they do not interfere with
        each other. Admonition blocks are kept together since they span
        multiple lines by design.

    Args:
        markdown_string: Markdown content.

    Returns:
        Typst-formatted string.
    """
    lines = markdown_string.split("\n")
    result_parts: list[str] = []
    i = 0
    while i < len(lines):
        if lines[i].startswith("!!!"):
            # Admonition block: collect the !!! line + all following indented lines
            block = [lines[i]]
            i += 1
            while i < len(lines) and lines[i].startswith("    "):
                block.append(lines[i])
                i += 1
            md.reset()
            result_parts.append(md.convert("\n".join(block)))
        elif lines[i].strip() == "":
            # Blank line: preserve it in the output.
            result_parts.append("")
            i += 1
        else:
            # Paragraph: group consecutive non-blank lines so that emphasis and
            # other inline markers can span lines within a paragraph.
            paragraph = [lines[i]]
            i += 1
            while (
                i < len(lines)
                and lines[i].strip() != ""
                and not lines[i].startswith("!!!")
            ):
                paragraph.append(lines[i])
                i += 1
            md.reset()
            result_parts.append(md.convert("\n".join(paragraph)))
    return "\n".join(result_parts)


def markdown_to_html(markdown_string: str) -> str:
    """Convert Markdown string to HTML using python-markdown library.

    Args:
        markdown_string: Markdown content.

    Returns:
        HTML-formatted string.
    """
    return markdown.markdown(markdown_string)
