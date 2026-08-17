{% if entry_type == "OneLineEntry" %}
table.cell(colspan: 2, fill: light-blue)[*{{ subsection_title }}*],
{% elif entry_type == "NormalEntry" %}
{% set ns = namespace(rows=0) %}
{% for entry in subsection_entries %}
{% set ns.rows = ns.rows + 1 + (entry.highlights | length if entry.highlights else 0) %}
{% endfor %}
table.cell(rowspan: {{ ns.rows }}, align: center + horizon)[#text(size: 8pt)[{{ subsection_title }}]],
{% else %}
table.cell(rowspan: {{ subsection_entries | length }}, align: center + horizon)[#text(size: 8pt)[{{ subsection_title }}]],
{% endif %}