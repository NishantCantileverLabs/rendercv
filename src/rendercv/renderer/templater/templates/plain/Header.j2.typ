#let contact() = (
  {% for connection in cv._connections %}
  [{{ connection }}],
  {% endfor %}
)
#align(center)[
  {% if cv.name %}
  #text(size: {{ design.typography.font_size.name }}, weight: "bold", fill: {{ design.colors.name }})[{{ cv.name }}]
  #v(2pt)
  {% endif %}
  #text(size: {{ design.typography.font_size.connections }})[#contact().join(text("  |  "))]
]
#v(8pt)
