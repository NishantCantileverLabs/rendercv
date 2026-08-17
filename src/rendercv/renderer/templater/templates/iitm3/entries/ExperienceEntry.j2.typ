{% if section_title.lower() == "positions of responsibility" %}
{% set matching_entries = section_entries | selectattr("company", "equalto", entry.company) | list %}
{% set is_first = (matching_entries | first) == entry %}
{% if is_first %}
{% set ns = namespace(rowspan=0) %}
{% for e in matching_entries %}
{% set ns.rowspan = ns.rowspan + 1 %}
{% if e.highlights %}{% set ns.rowspan = ns.rowspan + e.highlights|length %}{% endif %}
{% endfor %}
table.cell(rowspan: {{ ns.rowspan }}, align: center + horizon)[#text(size: 8pt)[{{ entry.company }}]],
{% endif %}
table.cell(fill: light-blue)[{{ entry.position }}],
{% if entry.highlights %}
{% for item in entry.highlights %}
[#h(1em) {{ item }}],
{% endfor %}
{% endif %}
{% else %}
table.cell(fill: light-blue)[{% if entry.position %}{{ entry.position }}{% if entry.company %}, {{ entry.company }}{% endif %}{% elif entry.company %}{{ entry.company }}{% endif %}],
{% if entry.highlights %}
{% for item in entry.highlights %}
[#h(0.2em) • {{ item }}],
{% endfor %}
{% endif %}
{% endif %}