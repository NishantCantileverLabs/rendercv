#cv-entry(
  [{% if entry.authors %}{{ entry.authors|join(", ") }}{% endif %}],
  [{% if entry.DATE %}{{ entry.DATE }}{% endif %}],
  [{% if entry.title %}{% if entry.url or entry.doi %}#link("{{ entry.url or entry.doi }}")[{{ entry.title }}]{% else %}{{ entry.title }}{% endif %}{% endif %}{% if entry.title and entry.journal %} — {% endif %}{% if entry.journal %}#text(style: "italic")[{{ entry.journal }}]{% endif %}],
  [],
  body: [
{% if entry.summary %}
{{ entry.summary }}
{% endif %}
{% if entry.highlights %}
{% for highlight in entry.highlights %}
- {{ highlight }}
{% endfor %}
{% endif %}
  ]
)
