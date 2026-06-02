[ {% if entry.end_date %}{{ entry.end_date }}{% else %}{{ entry.date_string }}{% endif %} ],
[ {{ entry.degree }} ],
[ {{ entry.institution }} ],
[ {% if entry.gpa %}{{ entry.gpa }}{% elif entry.cgpa %}{{ entry.cgpa }}{% else %} {% endif %} ],
