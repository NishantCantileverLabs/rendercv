#block(breakable: false)[
  #entry-header(
    [{{ entry.company }}],
    [{% if entry.location %}{{ entry.location }}{% endif %}]
  )
  #v(2pt)
  #grid(
    columns: (1fr, auto),
    text(style: "italic")[{% if entry.position %}{{ entry.position }}{% endif %}],
    text(style: "italic")[{% if entry.DATE %}{{ entry.DATE }}{% endif %}]
  )
  {% if entry.summary %}
  #v(2pt)
  {{ entry.summary }}
  {% endif %}
  {% if entry.highlights %}
  #v(2pt)
  {% for highlight in entry.highlights %}
  - {{ highlight }}
  {% endfor %}
  {% endif %}
]
