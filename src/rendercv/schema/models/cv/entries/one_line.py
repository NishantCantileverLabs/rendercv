import pydantic

from .bases.entry import BaseEntry


class OneLineEntry(BaseEntry):
    label: str | None = pydantic.Field(
        default=None,
        examples=["Languages", "Citizenship", "Security Clearance"],
    )
    details: str | None = pydantic.Field(
        default=None,
        examples=["English (native), Spanish (fluent)", "US Citizen", "Top Secret"],
    )
