#entry(
  [{{ entry.position }}],
  [{{ entry.company }}],
  [{{ entry.DATE }}],
  [
    {% if entry.highlights %}
    {% for item in entry.highlights %}
    - {{ item }}
    {% endfor %}
    {% endif %}
  ]
)
