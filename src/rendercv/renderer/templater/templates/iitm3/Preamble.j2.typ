#import "@preview/fontawesome:0.4.0": *
#import "@preview/metalogo:1.2.0": LaTeX
#show "LaTeX": LaTeX

#set page(
  paper: "{{ design.page.size }}",
  margin: (
    top: {{ design.page.top_margin }},
    bottom: {{ design.page.bottom_margin }},
    left: {{ design.page.left_margin }},
    right: {{ design.page.right_margin }}
  )
)
#set text(font: ({{ design.typography.font_family.body.split(',') | map('trim') | map('tojson') | join(', ') }}), size: {{ design.typography.font_size.body }}, kerning: true, costs: (runt: 200%), hyphenate: false)
#set par(justify: false)

#set document(
  title: "{{ cv.name }}",
  author: "{{ cv.name }}",
  date: datetime(
    year: {{ settings._resolved_current_date.year }},
    month: {{ settings._resolved_current_date.month }},
    day: {{ settings._resolved_current_date.day }},
  ),
)

// Standardize colors based on the visual design
#let dark-blue = rgb("#2B508C")
#let light-blue = rgb("#B4C6E7")
#let t-stroke = 1pt + black

// Remove spacing between tables to perfectly overlap the 1pt borders
#show table: set block(spacing: 0pt)
#set table(
  stroke: t-stroke,
  inset: (x: 4pt, y: 3.85pt),
)

// Section title row used across all sections
#let section-title(title, columns) = table.cell(colspan: columns, fill: dark-blue, align: center, text(fill: white, weight: "bold", size: 11pt)[#upper(title)])