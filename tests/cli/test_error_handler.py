import pytest
import typer

from rendercv.cli.error_handler import handle_user_errors
from rendercv.exception import (
    RenderCVUserError,
    RenderCVUserValidationError,
    RenderCVValidationError,
)


class TestHandleUserErrors:
    def test_returns_function_result_on_success(self):
        @handle_user_errors
        def successful_function():
            return None

        successful_function()

    def test_catches_user_errors_and_prints_message(self):
        @handle_user_errors
        def failing_function():
            raise RenderCVUserError("Something went wrong")

        with pytest.raises(typer.Exit):
            failing_function()

    def test_catches_validation_errors(self):
        @handle_user_errors
        def failing_function():
            raise RenderCVUserValidationError(
                validation_errors=[
                    RenderCVValidationError(
                        schema_location=("cv", "name"),
                        yaml_location=((1, 1), (1, 1)),
                        yaml_source="main_yaml_file",
                        input="123",
                        message="Invalid name",
                    )
                ]
            )

        with pytest.raises(typer.Exit) as exc_info:
            failing_function()

        assert exc_info.value.exit_code == 1

    def test_quiet_mode_suppresses_output(self, capsys):
        @handle_user_errors
        def failing_function(quiet: bool = False):  # noqa: ARG001
            raise RenderCVUserError("Something went wrong")

        with pytest.raises(typer.Exit):
            failing_function(quiet=True)

        assert capsys.readouterr().out == ""

    def test_propagates_non_user_errors(self):
        @handle_user_errors
        def failing_function():
            raise ValueError("Unexpected error")

        with pytest.raises(ValueError, match="Unexpected error"):
            failing_function()
