import contextlib
import re
from datetime import date as Date
from typing import Annotated, Literal, Self

import pydantic

from rendercv.exception import RenderCVInternalError

from ....validation_context import get_current_date
from .entry_with_date import BaseEntryWithDate


def validate_exact_date(date: str | int) -> str | int:
    """Validate date conforms to strict format requirements.

    Why:
        start_date/end_date need strict formats for date arithmetic (calculating
        duration). Unlike arbitrary dates, these must parse to actual Date objects
        for comparison and duration rendering. Partially typed dates (e.g., "2023-0"
        while the user is typing) pass through so that incremental rendering does not
        fail mid-keystroke; they are rendered as-is.

    Args:
        date: Date value to validate.

    Returns:
        Original date if valid or partially typed.
    """
    with contextlib.suppress(RenderCVInternalError, ValueError):
        get_date_object(date)
    return date


type ExactDate = Annotated[str | int, pydantic.AfterValidator(validate_exact_date)]


def get_date_object(date: str | int, current_date: Date | None = None) -> Date:
    """Convert date string/int to Python Date object.

    Why:
        Date arithmetic (start/end comparison, duration calculation) requires
        Python Date objects. This parser handles multiple formats including
        "present" keyword for ongoing positions.

    Example:
        ```py
        date_obj = get_date_object("2023-05", Date(2025, 1, 1))
        # Returns Date(2023, 5, 1)

        present_obj = get_date_object("present", Date(2025, 1, 1))
        # Returns Date(2025, 1, 1)
        ```

    Args:
        date: Date in YYYY-MM-DD, YYYY-MM, YYYY format, or "present".
        current_date: Reference date for "present" keyword.

    Returns:
        Python Date object.
    """
    if isinstance(date, int):
        date_object = Date(date, 1, 1)
    elif re.fullmatch(r"\d{4}-\d{2}-\d{2}", date):
        # Then it is in YYYY-MM-DD format
        date_object = Date.fromisoformat(date)
    elif re.fullmatch(r"\d{4}-\d{2}", date):
        # Then it is in YYYY-MM format
        date_object = Date.fromisoformat(f"{date}-01")
    elif re.fullmatch(r"\d{4}", date):
        # Then it is in YYYY format
        date_object = Date.fromisoformat(f"{date}-01-01")
    elif date == "present":
        if current_date is None:
            raise RenderCVInternalError(
                "current_date is None when processing 'present' date"
            )
        date_object = current_date
    else:
        raise RenderCVInternalError("This is not a valid date!")

    return date_object


class BaseEntryWithComplexFields(BaseEntryWithDate):
    model_config = pydantic.ConfigDict(json_schema_extra={"description": None})

    start_date: ExactDate | None = pydantic.Field(
        default=None,
        description="The start date in YYYY-MM-DD, YYYY-MM, or YYYY format.",
        examples=["2020-09-24", "2020-09", "2020"],
    )
    end_date: ExactDate | Literal["present"] | None = pydantic.Field(
        default=None,
        description=(
            'The end date in YYYY-MM-DD, YYYY-MM, or YYYY format. Use "present" for'
            " ongoing events, or omit it to indicate the event is ongoing."
        ),
        examples=["2024-05-20", "2024-05", "2024", "present"],
    )
    location: str | None = pydantic.Field(
        default=None,
        examples=["Istanbul, Türkiye", "New York, NY", "Remote"],
    )
    summary: str | None = pydantic.Field(
        default=None,
        examples=[
            "Led a team of 5 engineers to develop innovative solutions.",
            (
                "Completed advanced coursework in machine learning and artificial"
                " intelligence."
            ),
        ],
    )
    highlights: list[str] | None = pydantic.Field(
        default=None,
        description=(
            "Bullet points for key achievements, responsibilities, or contributions."
        ),
        examples=[
            [
                "Increased system performance by 40% through optimization.",
                "Mentored 3 junior developers and conducted code reviews.",
                "Implemented CI/CD pipeline reducing deployment time by 60%.",
            ]
        ],
    )

    @pydantic.model_validator(mode="after")
    def check_and_adjust_dates(self, info: pydantic.ValidationInfo) -> Self:
        date_is_provided = self.date not in (None, "")
        start_date_is_provided = self.start_date not in (None, "")
        end_date_is_provided = self.end_date not in (None, "")

        if date_is_provided:
            # If only date is provided, ignore start_date and end_date:
            self.start_date = None
            self.end_date = None
        elif not start_date_is_provided and end_date_is_provided:
            # If only end_date is provided, assume it is a one-day event and act like
            # only the date is provided:
            self.date = self.end_date
            self.start_date = None
            self.end_date = None
        elif start_date_is_provided and not end_date_is_provided:
            # If only start_date is provided, assume it is an ongoing event, i.e., the
            # end_date is present:
            self.end_date = "present"

        if self.start_date and self.end_date:
            # Compare the start_date with the end_date, but only when both dates can be
            # parsed. Partially typed dates (e.g., "2023-0") are allowed and simply
            # pass through without comparison so incremental rendering does not fail.
            current_date = get_current_date(info)
            try:
                start_date_object = get_date_object(self.start_date, current_date)
                end_date_object = get_date_object(self.end_date, current_date)
            except (RenderCVInternalError, ValueError):
                return self
            if start_date_object > end_date_object:
                # The user might be editing the dates, so the start_date can be
                # temporarily after the end_date. Do not raise; render as entered.
                pass

        return self
