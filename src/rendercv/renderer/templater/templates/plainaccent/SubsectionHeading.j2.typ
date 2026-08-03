{% if design.subsection_titles.space_above != "0cm" %}
#v({{ design.subsection_titles.space_above }})
{% endif %}
#text(weight: "bold", size: {{ design.typography.font_size.body }}, fill: {{ design.colors.section_titles }})[{{ subsection_title }}]
{% if design.subsection_titles.space_below != "0cm" %}
#v({{ design.subsection_titles.space_below }})
{% endif %}
