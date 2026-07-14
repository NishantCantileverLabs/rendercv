#block(breakable: false)[
*{{ entry.name }}*{% if entry.summary %}, _({{ entry.summary }})_{% endif %} #h(1fr) {% if entry.date or entry.start_date or entry.end_date %}_({% if entry.date %}{{ entry.date }}{% elif entry.start_date and entry.end_date %}{{ entry.start_date }} - {{ entry.end_date }}{% elif entry.start_date %}{{ entry.start_date }}{% elif entry.end_date %}{{ entry.end_date }}{% endif %})_{% endif %}

{% if entry.highlights %}
{% for highlight in entry.highlights %}
- {{ highlight }}
{% endfor %}
{% endif %}

]
