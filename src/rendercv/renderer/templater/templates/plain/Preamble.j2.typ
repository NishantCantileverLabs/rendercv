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

// Paragraph justification for the summary
#set par(justify: true)

// --- Helpers ---

// Section headings with a bottom border
#let section-heading(title) = {
  v({{ design.section_titles.space_above }})
  text(size: {{ design.typography.font_size.section_titles }}, weight: "bold", fill: {{ design.colors.section_titles }})[#title]
  v(-8pt)
  line(length: 100%, stroke: 0.8pt + {{ design.colors.section_titles }})
  v({{ design.section_titles.space_below }})
}

// Two-column line: title left, date/place right
#let entry-line(title, right) = {
  grid(
    columns: (1fr, auto),
    text(weight: "bold")[#title],
    text(weight: "bold")[#right]
  )
}
