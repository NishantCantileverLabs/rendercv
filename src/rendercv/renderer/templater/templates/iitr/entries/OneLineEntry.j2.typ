{% if entry.name %}
[
  *{{ entry.name }}* \
  {{ entry.details | replace('\n', ' \\ ') }}
],
{% else %}
align(right)[*{{ entry.label }}*],
align(left)[{{ entry.details }}],
{% endif %}
