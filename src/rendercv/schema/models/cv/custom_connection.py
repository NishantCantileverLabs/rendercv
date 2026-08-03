import pydantic

from ..base import BaseModelWithoutExtraKeys


class CustomConnection(BaseModelWithoutExtraKeys):
    """User-defined contact method with custom icon and URL.

    Why:
        Built-in social networks cover common platforms, but users need
        arbitrary contact methods (personal websites, custom platforms).
        CustomConnection provides a FontAwesome icon, display text, and
        optional URL for any contact channel.
    """

    fontawesome_icon: str | None = pydantic.Field(
        default=None,
        description=(
            "The Font Awesome icon name to render (from"
            " https://fontawesome.com/search)."
        ),
        examples=["calendar-days", "link"],
    )
    placeholder: str | None = pydantic.Field(
        default=None,
        description="The displayed text of the connection.",
        examples=["Book a call", "Portfolio"],
    )
    url: str | None = pydantic.Field(
        default=None,
        description="A URL link for the connection.",
        examples=["https://cal.com/johndoe", "https://portfolio.com"],
    )
