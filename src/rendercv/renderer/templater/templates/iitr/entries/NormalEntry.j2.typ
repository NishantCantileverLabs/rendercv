#entry(
  [{{ entry.name }}],
  [{{ entry.location if entry.location else '' }}],
  [{{ entry.DATE }}],
  [
    {% if entry.highlights %}
    {% for item in entry.highlights %}
    - {{ item }}
    {% endfor %}
    {% endif %}
  ]
)
