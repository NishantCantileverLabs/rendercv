#block(breakable: false)[
  #entry-header(
    [{{ entry.degree }}],
    [{% if entry.location %}{{ entry.location }} | {% endif %}{% if entry.DATE %}{{ entry.DATE }}{% endif %}]
  )
  #v(2pt)
  #text(style: "italic")[{% if entry.institution %}{{ entry.institution }}{% endif %}{% if entry.institution and entry.area %} — {% endif %}{% if entry.area %}{{ entry.area }}{% endif %}]
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
