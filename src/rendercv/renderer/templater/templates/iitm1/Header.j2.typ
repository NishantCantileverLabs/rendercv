#text(size: {{ design.typography.font_size.name }}, weight: "bold")[{% if design.institute %}{{ design.institute }}{% else %}Indian Institute of Technology, Madras{% endif %}]
#linebreak()
#text(size: 12pt, weight: "regular")[
  NAME: {{ cv.name }}
  #h(1fr)
  {% if design.roll_no %}ROLLNO: {{ design.roll_no }}{% endif %}
]
#v(0.5em)