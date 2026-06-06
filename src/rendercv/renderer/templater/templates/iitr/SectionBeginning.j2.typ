#section("{{ section_title }}")

{% if entry_type == "EducationEntry" %}
#table(
  columns: (auto, auto, 1fr, auto),
  align: (col, row) => {
    if row == 0 { center + horizon }
    else { (center, left, left, center).at(col) + horizon }
  },
  stroke: 0.5pt,
  [Year], [Degree/Examination], [Institution/Board], [CGPA/ \ Percentage],
{% elif snake_case_section_title == "references" %}
#grid(
  columns: (1fr, 1fr),
  column-gutter: 2em,
  row-gutter: 2em,

{% elif entry_type == "OneLineEntry" %}
#grid(
  columns: (22%, 1fr),
  column-gutter: 1em,
  row-gutter: 1.5mm,
{% elif snake_case_section_title == "area_of_interest" %}
#[
#show list: it => it.children.map(i => i.body).join(", ")
{% endif %}
