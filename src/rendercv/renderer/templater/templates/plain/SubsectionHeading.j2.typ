{% if design.subsection_titles.space_above != "0cm" %}
#v({{ design.subsection_titles.space_above }})
{% endif %}
#text(weight: "bold", size: {{ design.typography.font_size.body }})[{{ subsection_title|upper }}]
{% if design.subsection_titles.space_below != "0cm" %}
#v({{ design.subsection_titles.space_below }})
{% endif %}
