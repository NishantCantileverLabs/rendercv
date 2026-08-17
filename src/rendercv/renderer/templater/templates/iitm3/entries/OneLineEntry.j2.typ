table.cell(colspan: 2, fill: light-blue)[*{{ entry.label | upper }}*],
table.cell(colspan: 2)[{% if entry.details %}{{ entry.details }}{% endif %}],