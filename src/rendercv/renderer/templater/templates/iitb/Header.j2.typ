{% set institute_name = design.institute or "Indian Institute of Technology Bombay" %}
#grid(
  columns: {% if design.show_institute_banner %}(15%, 85%){% else %}(100%){% endif %},
  align: {% if design.show_institute_banner %}(center + horizon, left + horizon){% else %}left + horizon{% endif %},
  {% if design.show_institute_banner %}
  image("iitb.svg", width: 0.8in),
  {% endif %}
  block(
    width: 100%,
    grid(
      columns: (1fr, auto),
      row-gutter: 0.5em,
      text(size: {{ design.typography.font_size.name }}, weight: "bold")[{{ cv.name }}], [{% if design.roll_no %}{{ design.roll_no }}{% endif %}],
      text(weight: "bold")[{% if design.department %}{{ design.department }}{% endif %}], text(weight: "bold")[{% if design.degree %}{{ design.degree }}{% endif %}],
      [{% if design.show_institute_banner %}{{ institute_name }}{% endif %}], [{% if design.gender %}{{ design.gender }}{% endif %}]
    )
  )
)
#v(0.75em)
