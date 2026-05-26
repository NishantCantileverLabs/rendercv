#align(left)[
  #text(size: {{ design.typography.font_size.name }}, weight: "bold")[{{ cv.name }}]
]
#v(-6pt)

#let contact-info = ()
{% if cv.email %}
#contact-info.push([#fa-envelope(solid: true) #h(2pt) #link("mailto:{{ cv.email }}")[#"{{ cv.email }}"]])
{% endif %}
{% if cv.phone %}
#contact-info.push([#fa-phone() #h(2pt) #"{{ cv.phone|replace('tel:', '') }}"])
{% endif %}
{% if cv.social_networks %}{% for social in cv.social_networks %}
{% if social.network == "LinkedIn" %}
#contact-info.push([#fa-linkedin() #h(2pt) #link("{{ social.url }}")[#"{{ social.username }}"]])
{% elif social.network == "GitHub" %}
#contact-info.push([#fa-github() #h(2pt) #link("{{ social.url }}")[#"{{ social.username }}"]])
{% else %}
#contact-info.push([#link("{{ social.url }}")[#"{{ social.username }}"]])
{% endif %}
{% endfor %}{% endif %}

{% if cv.headline %}
{{ cv.headline }} #h(1fr) #contact-info.join([ | ])
{% else %}
#h(1fr) #contact-info.join([ | ])
{% endif %}

#v(2pt)
#line(length: 100%, stroke: 3pt)
#v(-4pt)
