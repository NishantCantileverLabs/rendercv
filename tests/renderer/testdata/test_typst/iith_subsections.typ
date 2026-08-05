#import "@preview/fontawesome:0.4.0": *
#import "@preview/metalogo:1.2.0": LaTeX
#show "LaTeX": LaTeX

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
#set par(leading: 0.6em, spacing: 0.6em)
#set block(spacing: 0.65em)
#set list(tight: true, marker: ([•], [◦]))

#set document(
  date: datetime(
    year: 2025,
    month: 11,
    day: 30,
  ),
)

#let section-header(title) = {
  v(0.15em)
  block(
    fill: rgb("d1d1d1"),
    width: 100%,
    inset: (top: 4pt, bottom: 4pt, left: 4pt),
    radius: 0pt,
    sticky: true,
    align(center)[#text(weight: "bold", size: 10pt)[#title]]
  )
  v(0.015em)
}

#grid(
  columns: (1fr, auto, 1fr),
  row-gutter: 0.3em,

  align(left + horizon)[
    #image("iith.svg", width: 0.7in)
  ],

  align(center + horizon)[
    #text(size: 18pt, weight: "bold")[#"Jane Doe"] \
    #v(2pt)
    #text(size: 10pt, weight: "regular")[]
  ],

  align(right + horizon)[
    #set text(weight: "regular", size: 9pt)
 \
    #v(1pt)
 \
    #v(1pt)
#fa-icon("linkedin", fill: rgb("#0a66c2"), size: 10pt)    #h(0.3em)
#fa-icon("github", fill: rgb("#24292e"), size: 10pt)  ]
)
#v(-0.2em)

#section-header("SELECTED WORK")

#text(weight: "bold")[Career Highlights]


Built a research platform that supports **mixed subsection entry types**.

#text(weight: "bold")[Featured Projects]


#block(breakable: false)[
- *Subsection Support*, _Implemented subsection-based sections across schema, rendering, and docs._ #h(1fr) _2024-02_

]

#text(weight: "bold")[Recent Milestones]


+ Rolled out subsection rendering

+ Added schema and snapshot coverage
#v(0.01em)
