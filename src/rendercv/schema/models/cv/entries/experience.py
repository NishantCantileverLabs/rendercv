import pydantic

from .bases.entry import BaseEntry
from .bases.entry_with_complex_fields import BaseEntryWithComplexFields


class BaseExperienceEntry(BaseEntry):
    company: str | None = pydantic.Field(
        default=None,
        examples=["Microsoft", "Google", "Princeton Plasma Physics Laboratory"],
    )
    position: str | None = pydantic.Field(
        default=None,
        examples=["Software Engineer", "Research Assistant", "Project Manager"],
    )


# This approach ensures ExperienceEntryBase keys appear first in the key order:
class ExperienceEntry(BaseEntryWithComplexFields, BaseExperienceEntry):
    pass
