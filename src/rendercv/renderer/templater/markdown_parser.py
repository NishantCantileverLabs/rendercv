import re
from xml.etree.ElementTree import Element

import markdown
import markdown.core
import markdown.preprocessors
import tylax


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
# Inline math must not be confused with currency or prose: an opening `$`
# followed by a digit or whitespace (e.g. "$20", "$ 5") is not math, and a
# closing `$` immediately preceded by whitespace is not math either. The block
# math alternative (`$$...$$`) may span multiple lines.
math_pattern = re.compile(
    r"(\$\$.*?\$\$|\$(?![\s0-9])([^$\n]+?)(?<!\s)\$)",
    re.DOTALL,
)
# Inline code spans (e.g. `` `$x^2$` ``) must be protected from math
# extraction so math-looking content inside them stays literal.
inline_code_pattern = re.compile(r"`+[^`\n]*?`+")


def latex_to_typst(latex_string: str) -> str:
    """Convert a LaTeX math expression to Typst math markup.

    Why:
        Users write math as inline LaTeX inside `$...$` delimiters
        (GitHub-flavored markdown). Typst uses its own math syntax, so the
        expression must be translated before it is embedded in Typst output.

    Args:
        latex_string: LaTeX math expression, without the surrounding `$`.

    Returns:
        Typst math markup.
    """
    return tylax.latex_to_typst(latex_string)


def convert_math_span_to_typst(math_span: str) -> str:
    """Convert a LaTeX math span (`$...$` or `$$...$$`) to Typst math.

    Args:
        math_span: Math span including its `$` delimiters.

    Returns:
        Typst math. Inline math keeps no spaces next to the delimiters, while
        block math gets spaces so Typst renders it as its own block.
    """
    if math_span.startswith("$$"):
        latex = math_span[2:-2]
        return "$ " + latex_to_typst(latex).strip() + " $"
    latex = math_span[1:-1]
    return "$" + latex_to_typst(latex).strip() + "$"


def extract_math(markdown_string: str) -> tuple[str, dict[str, str]]:
    """Replace LaTeX math spans in markdown with inert placeholders.

    Why:
        Math spans may contain characters that Markdown would otherwise
        interpret as markup (e.g. `*` inside `$a*b*c$` becomes emphasis).
        Replacing them with alphanumeric placeholders before Markdown
        processing keeps the math intact; the placeholders are restored after
        conversion. Inline code spans are protected first and restored right
        after, so math-looking content inside them (e.g. `` `$x^2$` ``) stays
        literal code instead of being converted.

    Args:
        markdown_string: Markdown content that may contain `$...$` math.

    Returns:
        Tuple of the string with placeholders substituted, and a mapping from
        each placeholder to its original math span.
    """
    math_spans: dict[str, str] = {}
    code_spans: list[tuple[str, str]] = []

    def protect_code(match: re.Match) -> str:
        placeholder = f"RENDERCVLATEXCODE{len(code_spans)}"
        code_spans.append((placeholder, match.group(0)))
        return placeholder

    def protect_math(match: re.Match) -> str:
        placeholder = f"RENDERCVLATEXMATH{len(math_spans)}"
        math_spans[placeholder] = match.group(0)
        return placeholder

    protected = inline_code_pattern.sub(protect_code, markdown_string)
    protected = math_pattern.sub(protect_math, protected)
    # Restore code spans so Markdown still renders them as code; the math
    # placeholders remain for restoration after Markdown conversion.
    for placeholder, code_span in code_spans:
        protected = protected.replace(placeholder, code_span)
    return protected, math_spans


def restore_math(typst_string: str, math_spans: dict[str, str]) -> str:
    """Replace math placeholders with converted Typst math.

    Args:
        typst_string: Typst markup that may contain math placeholders.
        math_spans: Mapping from placeholder to original LaTeX math span.

    Returns:
        Typst markup with placeholders replaced by converted Typst math.
    """
    for placeholder, math_span in math_spans.items():
        typst_string = typst_string.replace(
            placeholder, convert_math_span_to_typst(math_span)
        )
    return typst_string


def escape_typst_characters(string: str) -> str:
    """Escape Typst special characters while preserving commands.

    Why:
        User content may contain Typst special characters like `#`, `$`, `[` that
        would break compilation. Escaping prevents interpretation as commands.
        Existing Typst commands must remain unescaped. LaTeX math spans are
        already removed and replaced by placeholders before this runs.

    Args:
        string: Text to escape.

    Returns:
        Escaped string safe for Typst.
    """
    if string == "\n":
        return string

    # Find all the Typst commands and keep them separate so that nothing inside
    # them is escaped. A bare `#word` without arguments is a prose hashtag, not
    # a Typst command, so it is left to be escaped normally.
    typst_command_mapping = {}
    for i, match in enumerate(typst_command_pattern.finditer(string)):
        matched = match.group(0)
        if match.group(2) or match.group(3):
            dummy_name = f"RENDERCVTYPSTCOMMAND{i}"
            typst_command_mapping[dummy_name] = matched
            string = string.replace(matched, dummy_name)

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
    # Protect LaTeX math spans from Markdown processing: they are replaced by
    # placeholders here and restored as converted Typst math at the end.
    markdown_string, math_spans = extract_math(markdown_string)
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
    return restore_math("\n".join(result_parts), math_spans)


def markdown_to_html(markdown_string: str) -> str:
    """Convert Markdown string to HTML using python-markdown library.

    Args:
        markdown_string: Markdown content.

    Returns:
        HTML-formatted string.
    """
    return markdown.markdown(markdown_string)
