#block[
  #text(weight: "bold", size: 11pt)[{{ entry.position }}]
  #linebreak()
  #entry-line(
    [{% if entry.company %}{{ entry.company }}{% endif %}{% if entry.company and entry.location %} | {% endif %}{% if entry.location %}{{ entry.location }}{% endif %}],
    [{% if entry.DATE %}{{ entry.DATE }}{% endif %}]
  )
  {% if entry.summary %}
  #v(2pt)
  {{ entry.summary }}
  {% endif %}
  {% if entry.highlights %}
  #v(2pt)
  {% for highlight in entry.highlights %}
  - {{ highlight }}
  {% endfor %}
  {% endif %}
]
#v(8pt)
