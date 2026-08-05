import pytest

from rendercv.renderer.typst import generate_typst
from rendercv.schema.models.design.built_in_design import available_themes
from rendercv.schema.models.rendercv_model import RenderCVModel


@pytest.mark.parametrize("theme", available_themes)
@pytest.mark.parametrize("cv_variant", ["minimal", "full"])
def test_generate_typst(
    compare_file_with_reference,
    theme: str,
    cv_variant: str,
    request: pytest.FixtureRequest,
):
    base_model = request.getfixturevalue(f"{cv_variant}_rendercv_model")

    model = RenderCVModel(
        cv=base_model.cv,
        design={"theme": theme},
        locale=base_model.locale,
        settings=base_model.settings,
    )

    def generate_file(output_path):
        model.settings.render_command.typst_path = output_path
        generate_typst(model)

    reference_filename = f"{theme}_{cv_variant}.typ"
    assert compare_file_with_reference(generate_file, reference_filename)


@pytest.mark.parametrize("theme", available_themes)
def test_generate_typst_subsections(
    compare_file_with_reference,
    theme: str,
    subsections_rendercv_model: RenderCVModel,
):
    model = RenderCVModel(
        cv=subsections_rendercv_model.cv,
        design={"theme": theme},
        locale=subsections_rendercv_model.locale,
        settings=subsections_rendercv_model.settings,
    )

    def generate_file(output_path):
        model.settings.render_command.typst_path = output_path
        generate_typst(model)

    assert compare_file_with_reference(generate_file, f"{theme}_subsections.typ")


@pytest.mark.parametrize(
    ("theme", "logo_filename", "has_institute_text"),
    [
        ("iitr", "logo.svg", True),
        ("iitb", "iitb.svg", True),
        ("iith", "iith.svg", False),
    ],
)
def test_institute_banner_is_rendered_by_default(
    tmp_path,
    minimal_rendercv_model: RenderCVModel,
    theme: str,
    logo_filename: str,
    has_institute_text: bool,
):
    model = RenderCVModel(
        cv=minimal_rendercv_model.cv,
        design={"theme": theme},
        locale=minimal_rendercv_model.locale,
        settings=minimal_rendercv_model.settings,
    )

    model.settings.render_command.typst_path = tmp_path / f"{theme}.typ"
    typst_path = generate_typst(model)

    assert typst_path is not None
    typst_contents = typst_path.read_text(encoding="utf-8")
    assert logo_filename in typst_contents
    if has_institute_text:
        assert "Indian Institute of" in typst_contents


@pytest.mark.parametrize(
    ("theme", "logo_filename"),
    [
        ("iitr", "logo.svg"),
        ("iitb", "iitb.svg"),
        ("iith", "iith.svg"),
    ],
)
def test_institute_banner_can_be_disabled(
    tmp_path,
    minimal_rendercv_model: RenderCVModel,
    theme: str,
    logo_filename: str,
):
    model = RenderCVModel(
        cv=minimal_rendercv_model.cv,
        design={"theme": theme, "show_institute_banner": False},
        locale=minimal_rendercv_model.locale,
        settings=minimal_rendercv_model.settings,
    )

    model.settings.render_command.typst_path = tmp_path / f"{theme}.typ"
    typst_path = generate_typst(model)

    assert typst_path is not None
    typst_contents = typst_path.read_text(encoding="utf-8")
    assert logo_filename not in typst_contents
    if theme != "iith":
        assert "Indian Institute of" not in typst_contents


def test_subsection_spacing_is_rendered(
    tmp_path, subsections_rendercv_model: RenderCVModel
):
    model = RenderCVModel(
        cv=subsections_rendercv_model.cv,
        design={
            "theme": "classic",
            "subsection_titles": {
                "space_above": "0.2cm",
                "space_below": "0.1cm",
            },
        },
        locale=subsections_rendercv_model.locale,
        settings=subsections_rendercv_model.settings,
    )

    model.settings.render_command.typst_path = tmp_path / "subsections.typ"
    typst_path = generate_typst(model)

    assert typst_path is not None
    typst_contents = typst_path.read_text(encoding="utf-8")
    assert "#v(0.2cm)" in typst_contents
    assert "#v(0.1cm)" in typst_contents
