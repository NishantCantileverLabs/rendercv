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
#set text(font: "{{ design.typography.font_family.body }}", size: {{ design.typography.font_size.body }})
#set par(leading: {{ design.typography.line_spacing }}, spacing: {{ design.typography.line_spacing }})
#set block(spacing: 0.65em)
#set list(tight: true, marker: ([•], [◦]))

#let section-header(title) = {
  v({{ design.section_titles.space_above }})
  block(
    fill: rgb("d1d1d1"),
    width: 100%,
    inset: (top: 4pt, bottom: 4pt, left: 4pt),
    radius: 0pt,
    align(center)[#text(weight: "bold", size: 10pt)[#title]]
  )
  v({{ design.section_titles.space_below }})
}
