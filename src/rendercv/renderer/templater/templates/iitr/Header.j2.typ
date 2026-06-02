#grid(
  columns: (auto, 1fr, auto),
  column-gutter: 3mm,

  {% if cv.photo %}
  image("{{ cv.photo.name }}", width: 2cm),
  {% else %}
  [],
  {% endif %}

  [
    #text(size: {{ design.typography.font_size.name }})[{{ cv.name }}] \
    {% if cv.custom_fields and cv.custom_fields.course %}{{ cv.custom_fields.course }} \ {% endif %}
    {% if cv.custom_fields and cv.custom_fields.branch %}{{ cv.custom_fields.branch }} \ {% endif %}
    {% if cv.phone %}Contact No: {{ cv.phone }} \ {% endif %}
    {% if cv.email %}Email: {{ cv.email|replace('@', '\\@') }} \ {% endif %}
    {% if cv.custom_fields and cv.custom_fields.reg_no %}Registration No: {{ cv.custom_fields.reg_no }}{% endif %}
  ],

  align(right)[
    #grid(
      columns: (auto, auto),
      column-gutter: 2mm,
      align(right + horizon)[Indian Institute of \ Technology \ Roorkee],
      image("iitr.svg", width: 2cm)
    )
  ]
)
