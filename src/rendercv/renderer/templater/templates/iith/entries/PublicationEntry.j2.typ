#block(breakable: false)[
- *{{ entry.title }}*{% if entry.journal %}, _{{ entry.journal }}_{% endif %} #h(1fr) _{% if entry.date %}{{ entry.date }}{% endif %}_
  {% if entry.authors %}- {{ entry.authors|join(", ") }}{% endif %}
  {% if entry.doi or entry.url %}
  - {% if entry.doi %}#link("https://doi.org/{{ entry.doi }}")[DOI: {{ entry.doi }}]{% endif %}{% if entry.doi and entry.url %} | {% endif %}{% if entry.url %}#link("{{ entry.url }}")[URL]{% endif %}
  {% endif %}
]
