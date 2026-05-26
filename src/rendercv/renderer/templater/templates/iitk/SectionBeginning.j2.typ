{% set has_ongoing = namespace(value=false) %}
{% for section in cv.rendercv_sections %}
  {% if section.title == section_title %}
    {% for entry in section.entries %}
      {% set entry_str = entry | string %}
      {% if entry_type == "TextEntry" and ('*' in entry_str or 'ast' in entry_str) %}
        {% set has_ongoing.value = true %}
      {% endif %}
    {% endfor %}
  {% endif %}
{% endfor %}

{% if has_ongoing.value %}
#section-header("{{ section_title }}", right-text: "(*:Ongoing)")
{% else %}
#section-header("{{ section_title }}")
{% endif %}
{% if entry_type == "EducationEntry" %}
#align(center)[
  #table(
    columns: (14%, 32%, 1fr, 9%),
    stroke: 0.5pt + black,
    align: center,
    [*Year*], [*Degree/Certificate*], [*Institute*], [*CPI/%*],
{% elif entry_type == "OneLineEntry" %}
#v(-2pt)
#align(center)[
  #transposed-table(
{% elif entry_type == "TextEntry" %}
#v(-2pt)
#align(center)[
  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: 0.5pt + black,
    align: center,
{% endif %}
