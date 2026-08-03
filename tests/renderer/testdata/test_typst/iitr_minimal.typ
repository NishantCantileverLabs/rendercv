#set document(
  date: datetime(
    year: 2025,
    month: 11,
    day: 30,
  ),
)

#set page(
  paper: "a4",
  margin: (
    top: 1cm,
    bottom: 1cm,
    left: 1.25cm,
    right: 1.25cm
  ),
)

#set text(
  font: ("Helvetica Neue", "Arial", "Helvetica", "Liberation Sans", "sans-serif"),
  size: 9.5pt,
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
    text(size: 11pt)[#title]
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

#grid(
  columns: (auto, 1fr, auto),
  column-gutter: 3mm,

  [],

  [
    #text(size: 15pt)[John Doe] \
  ],

  align(right)[
    #grid(
      columns: (auto, auto),
      column-gutter: 2mm,
      align(right + horizon)[Indian Institute of \ Technology \ Roorkee],
      image("logo.svg", width: 2cm)
    )
  ]
)

#section("Experience")


- Software Engineer at Company X, 2020-2023
