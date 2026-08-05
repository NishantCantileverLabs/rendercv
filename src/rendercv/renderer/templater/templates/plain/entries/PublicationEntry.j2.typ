#block(breakable: false)[
  #entry-header(
    [{% if entry.authors %}{{ entry.authors|join(", ") }}{% endif %}],
    [{% if entry.DATE %}{{ entry.DATE }}{% endif %}]
  )
  {% if entry.title or entry.journal %}
  #v(2pt)
  {% if entry.title %}{% if entry.url or entry.doi %}#link("{{ entry.url or entry.doi }}")[{{ entry.title }}]{% else %}{{ entry.title }}{% endif %}{% endif %}{% if entry.title and entry.journal %} — {% endif %}{% if entry.journal %}#text(style: "italic")[{{ entry.journal }}]{% endif %}
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
