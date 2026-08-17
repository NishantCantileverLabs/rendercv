{% if entry_type == "EducationEntry" %}
)
{% elif entry_type == "OneLineEntry" %}
]
{% for entry in section_entries %}
{% if entry.details %}
*{{ entry.label }}:* {{ entry.details }}
{% endif %}
{% endfor %}
#v(0.5em)
{% elif entry_type == "BulletEntry" %}
#v(0.25em)
{% endif %}