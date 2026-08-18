{% if design.placement_registration_number %}
#grid(
  columns: (1fr, auto, 1fr),
  gutter: 1em,
  align(left + horizon)[
    #text(size: {{ design.typography.font_size.name }}, weight: "bold")[{{ cv.name }}{% if design.roll_no %} | {{ design.roll_no }}{% endif %}] \
    {% if cv.social_networks %}{% for social in cv.social_networks %}
    {% if social.network == "LinkedIn" %}LinkedIn profile: {{ social.url | clean_url }} \{% endif %}
    {% endfor %}{% endif %}
    {% if cv.website %}Professional/research profile: {{ cv.website | clean_url }} \{% endif %}
  ],
  align(center + top)[
    #text(10pt, weight: "bold")[{{ design.placement_registration_number }}]
  ],
  align(right + horizon)[
    {% if design.show_institute_banner %}
    #image(height: 2cm, "iitm.svg")
    {% endif %}
  ],
)
{% else %}
#grid(
  columns: (1fr, auto),
  gutter: 1em,
  align(left + horizon)[
    #text(size: {{ design.typography.font_size.name }}, weight: "bold")[{{ cv.name }}{% if design.roll_no %} | {{ design.roll_no }}{% endif %}] \
    {% if cv.social_networks %}{% for social in cv.social_networks %}
    {% if social.network == "LinkedIn" %}LinkedIn profile: {{ social.url | clean_url }} \{% endif %}
    {% endfor %}{% endif %}
    {% if cv.website %}Professional/research profile: {{ cv.website | clean_url }} \{% endif %}
  ],
  align(right + horizon)[
    {% if design.show_institute_banner %}
    #image(height: 2cm, "iitm.svg")
    {% endif %}
  ],
)
{% endif %}