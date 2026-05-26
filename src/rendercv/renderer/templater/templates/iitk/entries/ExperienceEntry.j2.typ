#block(breakable: false)[
#v(-2pt)
#block(fill: luma(220), width: 100%, inset: 4pt)[
  #let parts = ()
  {% if entry.company %}#parts.push([*{{ entry.company }}*]){% endif %}
  {% if entry.position %}#parts.push([{{ entry.position }}]){% endif %}
  {% if entry.location %}#parts.push([{{ entry.location }}]){% endif %}
  #parts.join([ | ]) #h(1fr) {% if entry.date %}_({{ entry.date }})_{% endif %}
]
#v(-4pt)

{% if entry.highlights %}
{% set has_groups = [] %}
{% for item in entry.highlights %}
  {% if '::' in item %}{% if has_groups.append(1) %}{% endif %}{% endif %}
{% endfor %}
{% if has_groups %}
#table-experience((
{% set current_label = namespace(value=None) %}
{% for item in entry.highlights %}
  {% if '::' in item %}
    {% set parts = item.split('::', 1) %}
    {% set label = parts[0].strip() %}
    {% set content = parts[1].strip() %}
  {% else %}
    {% set label = current_label.value %}
    {% set content = item %}
  {% endif %}
  
  {% if current_label.value != label %}
    {% if current_label.value != None %}
      )),
    {% endif %}
    ("{{ label }}", (
    {% set current_label.value = label %}
  {% endif %}
  [{{ content }}],
{% endfor %}
{% if current_label.value != None %}
  )),
{% endif %}
))
{% else %}
#v(2pt)
{% for item in entry.highlights %}
- {{ item }}
{% endfor %}
#v(3pt)
{% endif %}
{% endif %}

]
