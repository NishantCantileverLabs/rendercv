#cv-entry(
  [{{ entry.company }}],
  [{% if entry.location %}{{ entry.location }}{% endif %}],
  [{{ entry.position }}],
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
