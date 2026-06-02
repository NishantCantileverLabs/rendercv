#entry(
  [{{ entry.position }}],
  [{{ entry.company }}],
  [{{ entry.date_string }}],
  [
    {% for item in entry.highlights %}
    - {{ item }}
    {% endfor %}
  ]
)
