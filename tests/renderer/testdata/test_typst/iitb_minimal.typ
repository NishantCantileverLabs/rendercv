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
#set text(font: ("Libertinus Sans"), size: 10pt, kerning: true, costs: (runt: 200%), hyphenate: false)
#set par(leading: 0.45em, spacing: 0.45em)
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
      text(size: 14pt, weight: "bold")[John Doe], [],
      text(weight: "bold")[], text(weight: "bold")[],
      [Indian Institute of Technology Bombay], []
    )
  )
)
#v(0.75em)

#section-header("Experience")

Software Engineer at Company X, 2020-2023
#v(0.01em)
