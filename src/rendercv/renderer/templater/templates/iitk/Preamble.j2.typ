#import "@preview/fontawesome:0.4.0": *
#import "@preview/metalogo:1.2.0": LaTeX

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
#set par(spacing: {{ design.typography.line_spacing }})
#set list(indent: 0pt, body-indent: 4pt, tight: true)
#set block(spacing: 0.38em)

#show "LaTeX": LaTeX

#set document(
  title: "{{ cv.name }}",
  author: "{{ cv.name }}",
  date: datetime(
    year: {{ settings._resolved_current_date.year }},
    month: {{ settings._resolved_current_date.month }},
    day: {{ settings._resolved_current_date.day }},
  ),
)

#let section-header(title, right-text: none) = {
  v({{ design.section_titles.space_above }})
  block(
    fill: luma(200),
    width: 100%,
    inset: 3pt,
    radius: 0pt,
    sticky: true,
  )[
    *#text(title)*
    #if right-text != none and right-text != "" [
      #h(1fr) #text(weight: "regular", style: "italic", size: 9pt)[#right-text]
    ]
  ]
  v({{ design.section_titles.space_below }})
}

#let bullet-list(items) = {
  for item in items {
    grid(
      columns: (10pt, 1fr),
      [•], [ #item ]
    )
    v(2pt)
  }
}

#let table-experience(groups) = {
  let cells = ()
  for group in groups {
    let (label, items) = group
    if items.len() > 0 {
      cells.push(table.cell(fill: luma(200))[*#label*])
      cells.push(bullet-list(items))
    }
  }

  if cells.len() > 0 {
    table(
      columns: (auto, 1fr),
      stroke: 0.5pt + black,
      align: (center + horizon, left + horizon),
      inset: 3pt,
      ..cells
    )
  }
}

#let transposed-table(..cells) = {
  let cells = cells.pos()
  let labels = ()
  let details = ()
  for i in range(0, cells.len(), step: 2) {
    labels.push(table.cell(align: center + horizon)[#cells.at(i)])
    details.push(table.cell(align: left + horizon)[#cells.at(i+1)])
  }

  let num-cols = labels.len()
  let cols = (1fr,) * num-cols

  table(
    columns: cols,
    stroke: 0.5pt + black,
    inset: 3pt,
    ..labels,
    ..details
  )
}
