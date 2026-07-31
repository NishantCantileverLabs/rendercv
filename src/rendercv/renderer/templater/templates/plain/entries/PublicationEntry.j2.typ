#block[
  #entry-line(
    [{{ entry.title }}],
    [{% if entry.DATE %}{{ entry.DATE }}{% endif %}]
  )
  {% if entry.authors or entry.journal %}
  #v(-8pt)
  #text(style: "italic")[{% if entry.authors %}{{ entry.authors|join(", ") }}{% endif %}{% if entry.authors and entry.journal %} — {% endif %}{% if entry.journal %}{{ entry.journal }}{% endif %}]
  {% endif %}
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
#v(8pt)
