#cv-entry(
  [{{ entry.title }}],
  [],
  [{% if entry.authors %}{{ entry.authors|join(", ") }}{% endif %}{% if entry.authors and entry.journal %} — {% endif %}{% if entry.journal %}{{ entry.journal }}{% endif %}],
  [{% if entry.DATE %}{{ entry.DATE }}{% endif %}],
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
