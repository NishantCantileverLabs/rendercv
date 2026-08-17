{% if entry.details %}{% else %}{% if entry_index > 0 and entry_index % 3 == 0 %}
#colbreak()
{% endif %}
- {{ entry.label }}
#v(-0.25em)
{% endif %}