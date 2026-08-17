{% if not entry.highlights and not entry.location and not entry.url %}
- {{ entry.name }} #h(1fr) {% if entry.date %}_{{ entry.date }}_{% endif %}
{% else %}
#cv-item(
  [{% if entry.url %}#link("{{ entry.url }}")[{{ entry.name }}]{% else %}{{ entry.name }}{% endif %}{% if entry.location %}, {{ entry.location }}{% endif %}],
  [{% if entry.date %}{{ entry.date }}{% elif entry.start_date and entry.end_date %}{{ entry.start_date }} - {{ entry.end_date }}{% elif entry.start_date %}{{ entry.start_date }}{% elif entry.end_date %}{{ entry.end_date }}{% endif %}],
)[
{% if entry.highlights %}
{% for item in entry.highlights %}
- {{ item }}
{% endfor %}
{% endif %}
]
{% endif %}