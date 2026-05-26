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
#set text(font: "Source Sans 3", size: 10pt)
#set par(spacing: 0.6em)
#set list(indent: 0pt, body-indent: 4pt, tight: true)
#set block(spacing: 0.38em)

#show "LaTeX": LaTeX

#set document(
  title: "John Doe",
  author: "John Doe",
  date: auto,
)

#let section-header(title, right-text: none) = {
  v(0.5cm)
  block(
    fill: luma(200),
    width: 100%,
    inset: 3pt,
    radius: 0pt,
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
    labels.push(cells.at(i))
    details.push(cells.at(i+1))
  }

  // Set the first columns to auto for content size, and the last one to 1fr
  // to expand and flush the table to the right edge.
  let cols = range(0, labels.len()).map(i => {
    if i == labels.len() - 1 { 1fr } else { auto }
  })

  // Force table container to fill width completely
  box(width: 100%)[
    #table(
      columns: cols,
      stroke: 0.5pt + black,
      align: left,
      ..labels,
      ..details
    )
  ]
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
