#cv-entry(
  [{{ entry.name }}],
  [{% if entry.location %}{{ entry.location }}{% endif %}],
  [{% if entry.summary %}{{ entry.summary }}{% endif %}],
  [{% if entry.DATE %}{{ entry.DATE }}{% endif %}],
  body: [
{% if entry.highlights %}
{% for highlight in entry.highlights %}
- {{ highlight }}
{% endfor %}
{% endif %}
  ]
)
