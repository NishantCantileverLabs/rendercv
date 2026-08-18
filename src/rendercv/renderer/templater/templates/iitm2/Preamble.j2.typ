#import "@preview/fontawesome:0.4.0": *
#import "@preview/metalogo:1.2.0": LaTeX
#show "LaTeX": LaTeX

// Setup Page Rules & Variables
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

// Section heading styling
#let section-heading(title) = block(
  sticky: true,
  width: 100%,
  above: 1.2em,
  below: 0.5em,
  stroke: (bottom: 0.5pt),
  inset: (bottom: 3pt)
)[
  #text(size: {{ design.typography.font_size.section_titles }}, weight: "bold")[#upper(title)]
]

// Format for individual resume items
#let resume-item(title, date, subtitle, body) = block(breakable: false, width: 100%, below: 1em)[
  *#title* #h(1fr) #date \
  #if subtitle != none [
    #subtitle \
  ]
  #if body != none [
    #v(-0.5em)
    #body
  ]
]