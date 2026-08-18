#resume-item(
  [{{ entry.institution }}{% if entry.location %}, {{ entry.location }}{% endif %}],
  [{% if entry.date %}{{ entry.date }}{% elif entry.start_date and entry.end_date %}{{ entry.start_date }} - {{ entry.end_date }}{% elif entry.start_date %}{{ entry.start_date }}{% elif entry.end_date %}{{ entry.end_date }}{% endif %}],
  [{% if entry.degree %}{{ entry.degree }}{% if entry.area and entry.area != '' %} | {{ entry.area }}{% endif %}{% elif entry.area %}{{ entry.area }}{% endif %}],
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