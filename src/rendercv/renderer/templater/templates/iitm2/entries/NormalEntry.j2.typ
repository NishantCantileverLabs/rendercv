#resume-item(
  [{{ entry.name }}{% if entry.location %}, {{ entry.location }}{% endif %}],
  [{% if entry.date %}{{ entry.date }}{% elif entry.start_date and entry.end_date %}{{ entry.start_date }} - {{ entry.end_date }}{% elif entry.start_date %}{{ entry.start_date }}{% elif entry.end_date %}{{ entry.end_date }}{% endif %}],
  none,
  [
  {% if entry.summary %}
    {{ entry.summary }}
  {% endif %}
  {% if entry.highlights %}
  {% for highlight in entry.highlights %}
    - {{ highlight }}
  {% endfor %}
  {% endif %}
  ],
)