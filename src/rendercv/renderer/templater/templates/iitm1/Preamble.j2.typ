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
#set block(spacing: 0.65em)
#set list(tight: true)

#set document(
  title: "{{ cv.name }}",
  author: "{{ cv.name }}",
  date: datetime(
    year: {{ settings._resolved_current_date.year }},
    month: {{ settings._resolved_current_date.month }},
    day: {{ settings._resolved_current_date.day }},
  ),
)

// Section header styling macro (matches template_2's heading rules)
#let cv-section(title) = block(
  width: 100%,
  stroke: (top: 0.5pt, bottom: 0.5pt),
  inset: (top: 3pt, bottom: 3pt),
  spacing: 0em
)[
  #text(weight: "bold", size: {{ design.typography.font_size.section_titles }})[#upper(title)]
]

// Helper function for reusable experience/project entries
#let cv-item(title, date, body) = block(spacing: 0.5em)[
  *#title* #h(1fr) #date
  #body
]