#import "@preview/fontawesome:0.4.0": *
#import "@preview/metalogo:1.2.0": LaTeX

// Setup Page Rules & Variables
#set page(
  paper: "us-letter",
  margin: (
    top: 0.7in,
    bottom: 0.7in,
    left: 0.7in,
    right: 0.7in
  )
)
#set text(font: ("Source Sans 3"), size: 10pt, kerning: true, costs: (runt: 200%), hyphenate: false)
#set par(spacing: 0.6em)
#set list(indent: 0pt, body-indent: 4pt, tight: true)
#set block(spacing: 0.38em)

#show "LaTeX": LaTeX

#set document(
  title: "John Doe",
  author: "John Doe",
  date: datetime(
    year: 2025,
    month: 11,
    day: 30,
  ),
)

#let section-header(title, right-text: none) = {
  v(0.5cm)
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
  v(0.3cm)
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

#align(left)[
  #text(size: 30pt, weight: "bold")[John Doe]
]
#v(-6pt)

#let contact-info = ()

#h(1fr) #contact-info.join([ | ])

#v(2pt)
#line(length: 100%, stroke: 3pt)
#v(-4pt)


#section-header("Experience")
#v(-2pt)
#align(center)[
  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: 0.5pt + black,
    align: center,

  [Software Engineer at Company X, 2020-2023],
  )
]
