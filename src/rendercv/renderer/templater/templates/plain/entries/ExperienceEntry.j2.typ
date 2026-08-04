#block(breakable: false)[
  #entry-header(
    [{{ entry.position }}],
    [{% if entry.DATE %}{{ entry.DATE }}{% endif %}]
  )
  #v(2pt)
  #text(style: "italic")[{% if entry.company %}{{ entry.company }}{% endif %}{% if entry.company and entry.location %} | {% endif %}{% if entry.location %}{{ entry.location }}{% endif %}]
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
