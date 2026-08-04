#section-header("{{ section_title | upper }}")
{% if entry_type == "EducationEntry" %}
#align(center)[
  #table(
    columns: (1.2fr, 3.5fr, 0.8fr, 1fr),
    align: left,
    stroke: none,
    inset: (top: 4pt, bottom: 4pt, left: 4pt, right: 4pt),
    table.hline(),
    table.header(
      [*Degree*], [*University/Institute*], [*Year*], [*CGPA/(%)*],
    ),
    table.hline(),
{% endif %}
