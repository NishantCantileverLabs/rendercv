#import "@preview/fontawesome:0.4.0": *
#import "@preview/metalogo:1.2.0": LaTeX
#show "LaTeX": LaTeX

// Setup Page Rules & Variables
#set page(
  paper: "a4",
  margin: (
    top: 0.75in,
    bottom: 0.2in,
    left: 0.35in,
    right: 0.35in
  )
)
#set text(font: "Libertinus Sans", size: 10pt, kerning: true, costs: (runt: 200%), hyphenate: false)
#set par(leading: 0.45em, spacing: 0.45em)
#set block(spacing: 0.65em)
#set list(tight: true, marker: ([•], [◦]))

#let section-header(title) = {
  v(0.015em)
  block(
    fill: rgb("d1d1d1"),
    width: 100%,
    inset: (top: 4pt, bottom: 4pt, left: 4pt),
    radius: 0pt,
    text(weight: "bold", size: 10pt)[#title]
  )
  v(0.015em)
}

#grid(
  columns: (15%, 85%),
  align: (center + horizon, left + horizon),
  image("iitb.svg", width: 0.8in),
  block(
    width: 100%,
    grid(
      columns: (1fr, auto),
      row-gutter: 0.5em,
      text(size: 14pt, weight: "bold")[Jane Doe], [],
      text(weight: "bold")[], text(weight: "bold")[],
      [Indian Institute of Technology Bombay], []
    )
  )
)
#v(0.75em)

#section-header("Selected Work")

#text(weight: "bold")[Career Highlights]


Built a research platform that supports **mixed subsection entry types**.

#text(weight: "bold")[Featured Projects]


#block(breakable: false)[
*Subsection Support*, _(Implemented subsection-based sections across schema, rendering, and docs.)_ #h(1fr) _(2024-02)_

]

#text(weight: "bold")[Recent Milestones]


#reversed-numbered-entries(
  [

+ Rolled out subsection rendering

+ Added schema and snapshot coverage
  ],
)
#v(0.01em)
