table.cell(fill: light-blue)[*{{ entry.title }}*{% if entry.date %} | {{ entry.date }}{% endif %}],
{% if entry.authors %}[#h(0.2em) • {{ entry.authors|join(", ") }}],{% endif %}
{% if entry.journal %}[#h(0.2em) • _{{ entry.journal }}_],{% endif %}
{% if entry.doi or entry.url %}[#h(0.2em) • {% if entry.doi %}#link("https://doi.org/{{ entry.doi }}")[DOI: {{ entry.doi }}]{% endif %}{% if entry.doi and entry.url %} | {% endif %}{% if entry.url %}#link("{{ entry.url }}")[URL]{% endif %}],{% endif %}