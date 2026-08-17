[{{ entry.degree }}{% if entry.area and entry.area != '' %}, {{ entry.area }}{% endif %}],
    [{{ entry.institution }}],
    [{% if entry.cpi %}{{ entry.cpi }}{% elif entry.gpa %}{{ entry.gpa }}{% endif %}],
    [{% if entry.date %}{{ entry.date }}{% elif entry.end_date %}{{ entry.end_date }}{% endif %}],