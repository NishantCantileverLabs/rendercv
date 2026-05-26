{% if section_title|upper != "EDUCATION" %}
#section-header("{{ section_title }}")
{% endif %}
{% if entry_type == "EducationEntry" %}
#align(center)[
  #table(
    columns: (1.5fr, 1.2fr, 1.2fr, 1fr, 0.8fr),
    align: left,
    stroke: none,
    inset: (top: 4pt, bottom: 4pt, left: 4pt, right: 4pt),
    table.hline(),
    [*Examination*], [*University*], [*Institute*], [*Year*], [*CPI/%*],
    table.hline(),
{% elif entry_type == "OneLineEntry" %}
#set list(marker: none, body-indent: 0pt, indent: 0pt)
{% endif %}
