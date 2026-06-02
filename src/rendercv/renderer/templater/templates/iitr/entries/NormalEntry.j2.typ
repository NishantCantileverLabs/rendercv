#entry(
  [{{ entry.name }}],
  [{{ entry.location if entry.location else '' }}],
  [{{ entry.DATE }}],
  [
    {% for item in entry.highlights %}
    - {{ item }}
    {% endfor %}
  ]
)
