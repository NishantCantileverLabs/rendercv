#cv-entry(
  [{{ entry.institution }}],
  [{% if entry.location %}{{ entry.location }}{% endif %}],
  [{% if entry.degree %}{{ entry.degree }}{% endif %}{% if entry.degree and entry.area %} — {% endif %}{% if entry.area %}{{ entry.area }}{% endif %}],
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
