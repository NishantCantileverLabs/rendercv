import pydantic

from .bases.entry import BaseEntry


class NumberedEntry(BaseEntry):
    number: str | None = pydantic.Field(
        default=None,
        examples=["First publication about XYZ", "Patent for ABC technology"],
    )
