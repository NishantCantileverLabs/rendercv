table.cell(rowspan: {{ entry.highlights|length if entry.highlights else 1 }}, align: center + horizon)[#text(size: 8pt)[{{ entry.name }}]],
{% if entry.highlights %}
{% for item in entry.highlights %}
[#h(1em) • {{ item }}],
{% endfor %}
{% endif %}