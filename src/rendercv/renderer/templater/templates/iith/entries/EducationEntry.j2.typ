    [{{ entry.degree }}],
    [{% if entry.university %}{{ entry.university }}{% else %}{{ entry.institution }}{% endif %}],
    [{% if entry.date %}{{ entry.date }}{% elif entry.start_date and entry.end_date %}{{ entry.start_date }} - {{ entry.end_date }}{% elif entry.start_date %}{{ entry.start_date }}{% elif entry.end_date %}{{ entry.end_date }}{% else %}{% endif %}],
    [{% if entry.cpi %}{{ entry.cpi }}{% elif entry.gpa %}{{ entry.gpa }}{% else %}{% endif %}],
