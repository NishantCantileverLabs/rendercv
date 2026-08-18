#cv-section([{{ section_title }}])

{% if entry_type == "EducationEntry" %}
#table(
  columns: (2fr, 2fr, 1fr, 1fr),
  stroke: 0.5pt,
  align: center,
  [*PROGRAM*], [*INSTITUTION*], [*%/CGPA*], [*COMPLETION*],
{% elif entry_type == "OneLineEntry" %}
#columns(3)[
{% endif %}