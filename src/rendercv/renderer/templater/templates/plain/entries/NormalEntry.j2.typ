#block(breakable: false)[
  #entry-header(
    [{{ entry.name }}],
    [{% if entry.DATE %}{{ entry.DATE }}{% endif %}]
  )
  {% if entry.location or entry.summary %}
  #v(2pt)
  #text(style: "italic")[{% if entry.location %}{{ entry.location }}{% endif %}{% if entry.location and entry.summary %} — {% endif %}{% if entry.summary %}{{ entry.summary }}{% endif %}]
  {% endif %}
  {% if entry.highlights %}
  #v(2pt)
  {% for highlight in entry.highlights %}
  - {{ highlight }}
  {% endfor %}
  {% endif %}
]
