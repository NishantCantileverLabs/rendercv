import string

import pytest
from hypothesis import assume, given, settings
from hypothesis import strategies as st

from rendercv.renderer.templater.markdown_parser import (
    escape_typst_characters,
    markdown_to_html,
    markdown_to_typst,
)


class TestEscapeTypstCharacters:
    def test_returns_newline_unchanged(self):
        assert escape_typst_characters("\n") == "\n"

    @pytest.mark.parametrize(
        ("string", "expected"),
        [
            ("#", r"\#"),
            ("$", r"\$"),
            ("[", r"\["),
            ("]", r"\]"),
            ("\\", r"\\"),
            ('"', r"\""),
            ("@", r"\@"),
            ("%", r"\%"),
            ("~", r"\~"),
            ("_", r"\_"),
            ("/", r"\/"),
            (">", r"\>"),
            ("<", r"\<"),
        ],
    )
    def test_escapes_typst_special_characters(self, string, expected):
        assert escape_typst_characters(string) == expected

    @pytest.mark.parametrize(
        ("string", "expected"),
        [
            ("* test", "#sym.ast.basic test"),
            ("*test", "#sym.ast.basic#h(0pt, weak: true) test"),
        ],
    )
    def test_replaces_asterisks_with_typst_symbols(self, string, expected):
        assert escape_typst_characters(string) == expected

    def test_preserves_typst_commands_while_escaping_outside(self):
        string = "Keep #emph[a_b] but escape 5% and _"
        expected = "Keep #emph[a_b] but escape 5\\% and \\_"

        assert escape_typst_characters(string) == expected

    def test_escapes_math_delimiters_in_prose(self):
        # Math spans are handled before this function runs; a `$` that reaches
        # it is prose or currency and must be escaped.
        string = "$$a*b + c$$ and #1"
        expected = "\\$\\$a#sym.ast.basic#h(0pt, weak: true) b + c\\$\\$ and \\#1"

        assert escape_typst_characters(string) == expected

    @settings(deadline=None)
    @given(text=st.text(max_size=200))
    def test_never_crashes_on_arbitrary_input(self, text: str) -> None:
        escape_typst_characters(text)

    @settings(deadline=None)
    @given(
        text=st.text(
            alphabet=st.characters(
                categories=(), include_characters=string.ascii_letters + " "
            ),
            min_size=1,
            max_size=50,
        )
    )
    def test_leaves_plain_ascii_letters_unchanged(self, text: str) -> None:
        assume("*" not in text)
        assert escape_typst_characters(text) == text

    @settings(deadline=None)
    @given(
        name=st.from_regex(r"[a-zA-Z][a-zA-Z-]{0,10}", fullmatch=True),
        arg=st.from_regex(r"[a-zA-Z0-9 ]{0,10}", fullmatch=True),
    )
    def test_preserves_typst_commands_with_random_content(
        self, name: str, arg: str
    ) -> None:
        command = f"#{name}[{arg}]"
        result = escape_typst_characters(command)
        assert command in result


@pytest.mark.parametrize(
    ("markdown_string", "expected_typst_string"),
    [
        ("plain", "plain"),
        ("**b**", "#strong[b]"),
        ("*i*", "#emph[i]"),
        ("***x***", "#strong[#emph[x]]"),
        ("`c`", "`c`"),
        ("[x](https://myurl.com)", '#link("https://myurl.com")[x]'),
        (
            "[**b** *i* ***bi*** `c`](https://myurl.com)",
            '#link("https://myurl.com")[#strong[b] #emph[i] #strong[#emph[bi]] `c`]',
        ),
        ("**a *b* c**", "#strong[a #emph[b] c]"),
        (
            "quote*",
            "quote#sym.ast.basic#h(0pt, weak: true)",
        ),
        (
            "asteri*sks",
            "asteri#sym.ast.basic#h(0pt, weak: true) sks",
        ),
        (
            "* test",
            "- test",
        ),
        (
            "*test",
            "#sym.ast.basic#h(0pt, weak: true) test",
        ),
        (
            r"\*'s",
            "#sym.ast.basic#h(0pt, weak: true) 's",
        ),
        (
            r"\* x",
            "#sym.ast.basic x",
        ),
        (
            r"\*.x",
            "#sym.ast.basic#h(0pt, weak: true) .x",
        ),
        (
            r"\*\*bold\*\*",
            (
                "#sym.ast.basic#h(0pt, weak: true) "
                "#sym.ast.basic#h(0pt, weak: true) "
                "bold#sym.ast.basic#h(0pt, weak: true) "
                "#sym.ast.basic#h(0pt, weak: true)"
            ),
        ),
        # Typst commands should be preserved
        (
            "#test-typst-command[argument]",
            "#test-typst-command[argument]",
        ),
        (
            "#test-typst-command",
            r"\#test-typst-command",
        ),
        (
            "#test-typst-command(a, b)",
            "#test-typst-command(a, b)",
        ),
        (
            "#test-typst-command(a, b)[c, d]",
            "#test-typst-command(a, b)[c, d]",
        ),
        # things that look like commands but aren't:
        ("#1", r"\#1"),
        ("I made $100", r"I made \$100"),
        ("My # Text", "My \\# Text"),
        ("My % Text", "My \\% Text"),
        ("My ~ Text", "My \\~ Text"),
        ("My _ Text", "My \\_ Text"),
        ("My $ Text", "My \\$ Text"),
        ("My [ Text", "My \\[ Text"),
        ("My ] Text", "My \\] Text"),
        ("My \\ Text", "My \\\\ Text"),
        ('My " Text', 'My \\" Text'),
        ("My @ Text", "My \\@ Text"),
        (
            "[link_test#](Shouldn't be escaped in here & % # ~)",
            '#link("Shouldn\'t be escaped in here & % # ~")[link\\_test\\#]',
        ),
        ("60%", "60\\%"),
        # Bare #word without arguments is a hashtag in prose, not a command
        ("visit #tag", r"visit \#tag"),
        ("Email me at a@b.com or visit #tag", r"Email me at a\@b.com or visit \#tag"),
        # Currency and prose $ must not be confused with inline math
        ("I made $100 today", r"I made \$100 today"),
        ("Save $20 to $50", r"Save \$20 to \$50"),
        ("Cost: $5-$10 per item", r"Cost: \$5-\$10 per item"),
        ("price range $x to $y", r"price range \$x to \$y"),
        ("Earn $1,000-$2,000", r"Earn \$1,000-\$2,000"),
        # Inline LaTeX math is converted to Typst math
        ("Use $x^2 + y$ here", "Use $x^(2) + y$ here"),
        ("Result: $a/b$", "Result: $a slash b$"),
        (
            "Euler: $e^{i\\pi} + 1 = 0$",
            "Euler: $e^(i pi) + 1 = 0$",
        ),
        ("$x_1 + y_2$", "$x_(1) + y_(2)$"),
        ("$\\alpha + \\beta$", "$alpha + beta$"),
        (
            "$\\sum_{i=1}^{n} \\frac{i^2}{2}$",
            "$sum_(i = 1)^(n) frac(i^(2), 2)$",
        ),
        # * inside math must not be treated as Markdown emphasis
        ("$a*b*c$", "$a *b *c$"),
        # Math-looking content inside inline code stays literal
        ("`$x^2$`", "`$x^2$`"),
        ("`code with $5$`", "`code with $5$`"),
        ("code `$a/b$` and math $c^2$", "code `$a/b$` and math $c^(2)$"),
        ("`$a*b*c$` vs $a*b*c$", "`$a*b*c$` vs $a *b *c$"),
        # Display math ($$...$$) becomes Typst block math with spaces
        ("$$\\frac{1}{2}$$", "$ 1/2 $"),
        (
            "$$\\sum_{i=1}^{n} \\frac{i^2}{2}$$",
            "$ sum_(i = 1)^(n) frac(i^(2), 2) $",
        ),
        # Math inside other Markdown constructs still works
        ("**bold $x^2$ bold**", "#strong[bold $x^(2)$ bold]"),
        ("- item with $y$", "- item with $y$"),
        (
            "[link with $z$](https://myurl.com)",
            '#link("https://myurl.com")[link with $z$]',
        ),
        # Links
        (
            '[Google](https://www.google.com/search?q="quoted")',
            '#link("https://www.google.com/search?q=")[Google]',
        ),
        ("[no url]()", "no url"),
        # Emphasis spanning lines within a paragraph
        ("**bold\nspanning**", "#strong[bold\nspanning]"),
        # Lists
        ("1. first\n2. second", "1. first\n2. second"),
        ("- a\n- b", "- a\n- b"),
        ("- a\n  - b", "- a\n  - b"),
        ("- a\n    - b", "- a\n  - b"),
        # Blockquotes
        ("> quote", "#quote[quote]"),
        # Indented code
        ("    code here", "`code here`"),
        ("3 * 4", "3 #sym.ast.basic 4"),
        (
            (
                "!!! summary\n"
                "    Did #emph[this] and this is a #strong[bold]"
                ' #link("https://example.com")[link]. But I must explain to you how all'
                " this mistaken idea of denouncing pleasure and praising pain was born"
                " and I will give you a complete account of the system, and expound the"
                " actual teachings of the great explorer of the truth, the"
                " master-builder of human happiness. No one rejects, dislikes, or"
                " avoids pleasure itself, because it is pleasure, but because those who"
                " do not know how to pursue pleasure rationally encounter consequences"
                " that are extremely painful."
            ),
            (
                "#summary[Did #emph[this] and this is a #strong[bold]"
                ' #link("https://example.com")[link]. But I must explain to you how all'
                " this mistaken idea of denouncing pleasure and praising pain was born"
                " and I will give you a complete account of the system, and expound the"
                " actual teachings of the great explorer of the truth, the"
                " master-builder of human happiness. No one rejects, dislikes, or"
                " avoids pleasure itself, because it is pleasure, but because those who"
                " do not know how to pursue pleasure rationally encounter consequences"
                " that are extremely painful.]"
            ),
        ),
        (
            "!!! summary\n    This is a multi-line summary\n    with two lines",
            "#summary[This is a multi-line summary \\ with two lines]",
        ),
    ],
)
def test_markdown_to_typst(markdown_string, expected_typst_string):
    assert markdown_to_typst(markdown_string) == expected_typst_string


class TestMarkdownToTypst:
    def test_emphasis_markers_do_not_interact_across_lines(self):
        result = markdown_to_typst("**bold text**\n*italic text*")
        assert result == "#strong[bold text]\n#emph[italic text]"

    def test_nested_emphasis_across_lines_stay_independent(self):
        result = markdown_to_typst("**a *b* c**\n*d **e** f*")
        assert "#strong[" in result.split("\n")[0]
        assert "#emph[" in result.split("\n")[1]
        for line in result.split("\n"):
            assert line.count("[") == line.count("]")

    def test_admonition_still_works_with_line_processing(self):
        result = markdown_to_typst("**bold**\n!!! summary\n    Some text\n*italic*")
        lines = result.split("\n")
        assert lines[0] == "#strong[bold]"
        assert lines[1] == "#summary[Some text]"
        assert lines[2] == "#emph[italic]"

    def test_empty_lines_preserved(self):
        result = markdown_to_typst("**bold**\n\n*italic*")
        assert result == "#strong[bold]\n\n#emph[italic]"

    def test_multiline_display_math_is_converted(self):
        result = markdown_to_typst("$$\n\\frac{1}{2}\n$$")
        assert result == "$ 1/2 $"

    def test_multiple_math_spans_do_not_interfere(self):
        result = markdown_to_typst("$x^2$ and $y_3$")
        assert result == "$x^(2)$ and $y_(3)$"

    def test_math_is_protected_from_markdown_emphasis(self):
        result = markdown_to_typst("$a*b*c$ and **bold**")
        assert result == "$a *b *c$ and #strong[bold]"

    def test_math_inside_inline_code_is_not_converted(self):
        result = markdown_to_typst("`$x^2$` and $x^2$")
        assert result == "`$x^2$` and $x^(2)$"

    def test_code_and_math_on_same_line(self):
        result = markdown_to_typst("`$a/b$` vs $a/b$")
        assert result == "`$a/b$` vs $a slash b$"

    @settings(deadline=None)
    @given(text=st.text(max_size=300))
    def test_never_crashes_on_arbitrary_input(self, text: str) -> None:
        markdown_to_typst(text)

    @settings(deadline=None)
    @given(
        text=st.text(
            alphabet=st.characters(
                categories=(),
                include_characters=string.ascii_letters + string.digits + " ",
            ),
            min_size=0,
            max_size=100,
        )
    )
    def test_preserves_plain_text_content(self, text: str) -> None:
        assume("*" not in text and "!" not in text)
        assume(text.strip())
        result = markdown_to_typst(text)
        assert result.split() == text.split()

    @settings(deadline=None)
    @given(
        text=st.text(max_size=200).filter(
            lambda s: (
                "!!!" not in s and "\t" not in s and "    " not in s and "\r" not in s
            )
        )
    )
    def test_preserves_line_count_for_non_admonition(self, text: str) -> None:
        result = markdown_to_typst(text)
        assert result.count("\n") == text.count("\n")

    @settings(deadline=None)
    @given(
        word=st.text(
            alphabet=st.characters(
                categories=(), include_characters=string.ascii_letters + string.digits
            ),
            min_size=1,
            max_size=20,
        )
    )
    def test_bold_produces_strong(self, word: str) -> None:
        result = markdown_to_typst(f"**{word}**")
        assert f"#strong[{word}]" in result

    @settings(deadline=None)
    @given(
        word=st.text(
            alphabet=st.characters(
                categories=(), include_characters=string.ascii_letters + string.digits
            ),
            min_size=1,
            max_size=20,
        )
    )
    def test_italic_produces_emph(self, word: str) -> None:
        result = markdown_to_typst(f"*{word}*")
        assert f"#emph[{word}]" in result


def test_markdown_to_html():
    assert (
        markdown_to_html("Hello, **world**!") == "<p>Hello, <strong>world</strong>!</p>"
    )
