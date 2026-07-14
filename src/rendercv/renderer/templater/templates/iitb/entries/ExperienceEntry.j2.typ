#block(breakable: false)[
- *{{ entry.position }}* | #strong(emph([{{ entry.company }}])) #h(1fr) {% if entry.date or entry.start_date or entry.end_date %}#emph([{% if entry.date %}{{ entry.date }}{% elif entry.start_date and entry.end_date %}{{ entry.start_date }} - {{ entry.end_date }}{% elif entry.start_date %}{{ entry.start_date }}{% elif entry.end_date %}{{ entry.end_date }}{% endif %}]){% endif %}
  {% if entry.highlights %}
  {% for highlight in entry.highlights %}
  - {{ highlight }}
  {% endfor %}
  {% endif %}
]
