[ {% if entry.END_DATE %}{{ entry.END_DATE }}{% else %}{{ entry.DATE }}{% endif %} ],
[ {{ entry.degree }} ],
[ {{ entry.institution }} ],
[ {% if entry.gpa %}{{ entry.gpa }}{% elif entry.cgpa %}{{ entry.cgpa }}{% else %} {% endif %} ],
