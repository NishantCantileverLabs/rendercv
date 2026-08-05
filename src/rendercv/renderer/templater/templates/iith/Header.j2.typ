{% set ns = namespace(linkedin_url=none, github_url=none) %}
{% if cv.social_networks %}{% for social in cv.social_networks %}
  {% if social.network == "LinkedIn" or social.network == "linkedin" %}
    {% set ns.linkedin_url = "https://linkedin.com/in/" ~ social.username %}
  {% elif social.network == "GitHub" or social.network == "github" %}
    {% set ns.github_url = "https://github.com/" ~ social.username %}
  {% endif %}
{% endfor %}{% endif %}
#grid(
  columns: (1fr, auto, 1fr),
  row-gutter: 0.3em,

  align(left + horizon)[
  {% if design.show_institute_banner %}
    #image("iith.svg", width: 0.7in)
  {% endif %}
  ],

  align(center + horizon)[
    #text(size: 18pt, weight: "bold")[#"{{ cv.name }}"] \
    #v(2pt)
    #text(size: 10pt, weight: "regular")[{% if design.degree %}#"{{ design.degree }}"{% endif %}{% if design.degree and design.department %} in {% endif %}{% if design.department %}#"{{ design.department }}"{% endif %}]
  ],

  align(right + horizon)[
    #set text(weight: "regular", size: 9pt)
    {% if cv.email %}#link("mailto:{{ cv.email }}")[#"{{ cv.email }}"]{% endif %} \
    #v(1pt)
    {% if cv.phone %}#"{{ cv.phone | replace('tel:', '') }}"{% endif %} \
    #v(1pt)
    {% if ns.linkedin_url %}#link("{{ ns.linkedin_url }}")[#fa-icon("linkedin", fill: rgb("#0a66c2"), size: 10pt)]{% else %}#fa-icon("linkedin", fill: rgb("#0a66c2"), size: 10pt){% endif %}
    #h(0.3em)
    {% if ns.github_url %}#link("{{ ns.github_url }}")[#fa-icon("github", fill: rgb("#24292e"), size: 10pt)]{% else %}#fa-icon("github", fill: rgb("#24292e"), size: 10pt){% endif %}
  ]
)
#v(-0.2em)
