#entry(
  [{{ entry.position }}],
  [{{ entry.company }}],
  [{{ entry.DATE }}],
  [
    {% for item in entry.highlights %}
    - {{ item }}
    {% endfor %}
  ]
)
