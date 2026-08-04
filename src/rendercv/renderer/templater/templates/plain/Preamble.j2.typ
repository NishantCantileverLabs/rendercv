#import "@preview/rendercv:0.3.0": *

// The rendercv package's link function requires the package's configuration
// state, so replace it with a plain hyperlink that keeps the current text style.
#let link(dest, body, icon: none, if-underline: none, if-color: none) = original-link(dest, body)

// Setup Page Rules & Variables
#set document(
  author: "{{ cv._plain_name }}",
  title: "{{ settings.pdf_title }}",
  date: datetime(
    year: {{ settings._resolved_current_date.year }},
    month: {{ settings._resolved_current_date.month }},
    day: {{ settings._resolved_current_date.day }},
  ),
)
#set page(
  paper: "{{ design.page.size }}",
  margin: (
    top: {{ design.page.top_margin }},
    bottom: {{ design.page.bottom_margin }},
    left: {{ design.page.left_margin }},
    right: {{ design.page.right_margin }}
  )
)
#set text(
  font: ({{ design.typography.font_family.body.split(',') | map('trim') | map('tojson') | join(', ') }}),
  size: {{ design.typography.font_size.body }},
  fill: {{ design.colors.body }},
)

// Paragraph and list formatting for a balanced layout
#set par(justify: true, leading: 0.6em)
#set list(tight: true, spacing: 3pt)

// --- Helpers ---

// Section headings with a bottom border
// The sticky block keeps the heading with the following content when a page
// break would otherwise leave it alone at the bottom of a page. The above and
// below values compensate for the spacing the block wrapper introduces.
#let section-heading(title) = {
  block(
    sticky: true,
    width: 100%,
    above: 16.7pt,
    below: 12pt,
  )[
    #v({{ design.section_titles.space_above }})
    #text(size: {{ design.typography.font_size.section_titles }}, weight: "bold", fill: {{ design.colors.section_titles }})[#title]
    #v(-6pt)
    #line(length: 100%, stroke: 0.8pt + {{ design.colors.section_titles }})
    #v({{ design.section_titles.space_below }})
  ]
}

// Helper to put the entry title (left) and the date (right) on the same line
#let entry-header(title, date, date-weight: "bold") = {
  grid(
    columns: (1fr, auto),
    text(weight: "bold", size: 11pt)[#title],
    text(weight: date-weight)[#date]
  )
}
