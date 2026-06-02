#entry(
  [{{ entry.name }}],
  [{{ entry.location if entry.location else '' }}],
  [{{ entry.date_string }}],
  [
    {% for item in entry.highlights %}
    - {{ item }}
    {% endfor %}
  ]
)
