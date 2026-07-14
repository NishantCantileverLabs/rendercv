#set page(
  paper: "{{ design.page.size }}",
  margin: (
    top: {{ design.page.top_margin }},
    bottom: {{ design.page.bottom_margin }},
    left: {{ design.page.left_margin }},
    right: {{ design.page.right_margin }}
  ),
)

#set text(
  font: ({{ design.typography.font_family.body.split(',') | map('trim') | map('tojson') | join(', ') }}),
  size: {{ design.typography.font_size.body }},
  kerning: true,
  costs: (runt: 200%),
  hyphenate: false,
)

// ==========================================
// HELPER FUNCTIONS
// ==========================================
#let section(title) = {
  v(-0.2em)
  grid(
    columns: (22%, auto),
    align: bottom,
    column-gutter: 2mm,
    line(length: 100%, stroke: 1.5pt),
    text(size: {{ design.typography.font_size.section_titles }})[#title]
  )
  v(-0.35em)
}

#let entry(title, org, date, body) = {
  block(width: 100%)[
    #grid(
      columns: (1fr, auto),
      [ *#title* #if org != none and org != "" [ | #org ] ],
      [ #date ]
    )
    #if body != [] and body != none and body != "" [
      #v(-1.5mm)
      #body
    ]
  ]
}

#let table-experience(groups) = {
  let cells = ()
  for group in groups {
    let (label, items) = group
    if items.len() > 0 {
      cells.push(align(right)[#label])
      cells.push(align(left)[#items.join(", ")])
    }
  }
  if cells.len() > 0 {
    grid(
      columns: (22%, 1fr),
      column-gutter: 1em,
      row-gutter: 1.5mm,
      ..cells
    )
  }
}
