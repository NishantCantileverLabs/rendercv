#grid(
  columns: (15%, 85%),
  align: (center + horizon, left + horizon),
  image("iitb.svg", width: 0.8in),
  block(
    width: 100%,
    grid(
      columns: (1fr, auto),
      row-gutter: 0.5em,
      text(size: {{ design.typography.font_size.name }}, weight: "bold")[{{ cv.name }}], [{% if design.roll_no %}{{ design.roll_no }}{% endif %}],
      text(weight: "bold")[{% if design.department %}{{ design.department }}{% endif %}], text(weight: "bold")[{% if design.degree %}{{ design.degree }}{% endif %}],
      [{% if design.institute %}{{ design.institute }}{% else %}Indian Institute of Technology Bombay{% endif %}], [{% if design.gender %}{{ design.gender }}{% endif %}]
    )
  )
)
#v(0.75em)
