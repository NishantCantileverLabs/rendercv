#cv-entry(
  [{{ entry.company }}],
  [{% if entry.DATE %}{{ entry.DATE }}{% endif %}],
  [{{ entry.position }}],
  [{% if entry.location %}{{ entry.location }}{% endif %}],
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
