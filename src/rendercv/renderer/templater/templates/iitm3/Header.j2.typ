#grid(
  columns: (1fr, auto),
  align(left)[
    #text(size: {{ design.typography.font_size.name }}, weight: "bold")[{{ cv.name }}{% if design.roll_no %} | {{ design.roll_no }}{% endif %}] \
    #text(size: 12pt)[{% if design.institute %}{{ design.institute }}{% else %}Indian Institute of Technology Madras{% endif %}]
  ],
  align(right)[
    {% if design.show_institute_banner %}
    #image(height: 1cm, "iitm.svg")
    {% endif %}
  ],
)

#v(4pt)