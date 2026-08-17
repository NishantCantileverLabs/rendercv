{% if entry_type == "EducationEntry" %}
#table(
  columns: (auto, 4fr, auto, auto),
  align: center,
  section-title([{{ section_title }}], 4),
  table.cell(fill: light-blue)[*Programme*],
  table.cell(fill: light-blue)[*Institution*],
  table.cell(fill: light-blue)[*CGPA/%*],
  table.cell(fill: light-blue)[*Year of Completion*],
{% elif entry_type == "OneLineEntry" %}
#table(
  columns: (50%, 50%),
  section-title([{{ section_title }}], 2),
{% elif entry_type == "TextEntry" %}
#table(
  columns: (1fr, 1fr, 1fr),
  section-title([{{ section_title }}], 3),
{% elif entry_type == "BulletEntry" %}
#table(
  columns: (1fr, 1fr, 1fr),
  section-title([{{ section_title }}], 3),
{% elif entry_type == "ExperienceEntry" and section_title.lower() == "positions of responsibility" %}
#table(
  columns: (12%, 88%),
  section-title([{{ section_title }}], 2),
{% elif entry_type == "NormalEntry" %}
#table(
  columns: (12%, 88%),
  section-title([{{ section_title }}], 2),
{% else %}
#table(
  columns: 100%,
  section-title([{{ section_title }}], 1),
{% endif %}