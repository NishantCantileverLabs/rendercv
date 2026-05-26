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
#set text(font: "Source Sans 3", size: 10pt)
#set par(leading: 0.6em, spacing: 0.6em)
#set block(spacing: 0.65em)
#set list(tight: true, marker: ([•], [◦]))

#let section-header(title) = {
  v(0.15em)
  block(
    fill: rgb("d1d1d1"),
    width: 100%,
    inset: (top: 4pt, bottom: 4pt, left: 4pt),
    radius: 0pt,
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
    #text(size: 18pt, weight: "bold")[#"John Doe"] \
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

#section-header("EXPERIENCE")

Software Engineer at Company X, 2020-2023
#v(0.01em)
