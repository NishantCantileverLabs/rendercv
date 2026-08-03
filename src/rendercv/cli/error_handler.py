import functools
from collections.abc import Callable

import rich.panel
import typer
from rich import print

from rendercv.exception import RenderCVUserError, RenderCVUserValidationError

from .render_command.progress_panel import build_validation_errors_table


def handle_user_errors[**P](function: Callable[P, None]) -> Callable[P, None]:
    """Decorator that catches user errors and displays friendly messages without stack traces.

    Why:
        CLI commands should show clean error messages for expected user errors
        (invalid YAML, missing files) while preserving stack traces for
        unexpected errors. This decorator wraps all command functions.

    Example:
        ```py
        @app.command()
        @handle_user_errors
        def my_command():
            # Any RenderCVUserError gets caught and displayed cleanly
            pass
        ```

    Args:
        function: CLI command function to wrap.

    Returns:
        Wrapped function with error handling.
    """

    @functools.wraps(function)
    def wrapper(*args: P.args, **kwargs: P.kwargs) -> None:
        try:
            return function(*args, **kwargs)
        except RenderCVUserValidationError as e:
            if not kwargs.get("quiet", False):
                print(
                    rich.panel.Panel(
                        build_validation_errors_table(e.validation_errors),
                        title="[bold red]There are validation errors![/bold red]",
                        title_align="left",
                        border_style="bold red",
                    )
                )
            raise typer.Exit(code=1) from e
        except RenderCVUserError as e:
            if e.message and not kwargs.get("quiet", False):
                print(
                    rich.panel.Panel(
                        e.message,
                        title="[bold red]Error[/bold red]",
                        title_align="left",
                        border_style="bold red",
                    )
                )
            raise typer.Exit(code=1) from e

    return wrapper
