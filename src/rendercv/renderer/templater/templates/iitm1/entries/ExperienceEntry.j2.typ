#cv-item(
  [{% if entry.position %}{{ entry.position }}{% if entry.company %}, {{ entry.company }}{% endif %}{% elif entry.company %}{{ entry.company }}{% endif %}],
  [{% if entry.date %}{{ entry.date }}{% elif entry.start_date and entry.end_date %}{{ entry.start_date }} - {{ entry.end_date }}{% elif entry.start_date %}{{ entry.start_date }}{% elif entry.end_date %}{{ entry.end_date }}{% endif %}],
)[
{% if entry.highlights %}
{% for item in entry.highlights %}
- {{ item }}
{% endfor %}
{% endif %}
]