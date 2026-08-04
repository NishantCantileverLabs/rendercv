#import "@preview/rendercv:0.3.0": *

// The rendercv package's link function requires the package's configuration
// state, so replace it with a plain hyperlink that keeps the current text style.
#let link(dest, body, icon: none, if-underline: none, if-color: none) = original-link(dest, body)

// Setup Page Rules & Variables
#set document(
  author: "John Doe",
  title: "John Doe - CV",
  date: datetime(
    year: 2025,
    month: 11,
    day: 30,
  ),
)
#set page(
  paper: "a4",
  margin: (
    top: 1.5cm,
    bottom: 1.5cm,
    left: 1.5cm,
    right: 1.5cm
  )
)
#set text(
  font: ("Arial", "Helvetica Neue", "Liberation Sans", "sans-serif"),
  size: 10pt,
  fill: rgb(0, 0, 0),
)

// Paragraph and list formatting for a balanced layout
#set par(justify: true, leading: 0.6em)
#set list(tight: true, spacing: 3pt)

// --- Helpers ---

// Section headings with a bottom border
// The sticky block keeps the heading with the following content when a page
// break would otherwise leave it alone at the bottom of a page. The above and
// below values compensate for the spacing the block wrapper introduces.
#let section-heading(title) = {
  block(
    sticky: true,
    width: 100%,
    above: 16.7pt,
    below: 12pt,
  )[
    #v(10pt)
    #text(size: 14pt, weight: "bold", fill: rgb(0, 0, 0))[#title]
    #v(-6pt)
    #line(length: 100%, stroke: 0.8pt + rgb(0, 0, 0))
    #v(4pt)
  ]
}

// Helper to put the entry title (left) and the date (right) on the same line
#let entry-header(title, date, date-weight: "bold") = {
  grid(
    columns: (1fr, auto),
    text(weight: "bold", size: 11pt)[#title],
    text(weight: date-weight)[#date]
  )
}

#let contact() = (
)
#align(center)[
  #text(size: 28pt, weight: "bold", fill: rgb(0, 0, 0))[John Doe]
  #v(2pt)
  #text(size: 10pt)[#contact().join(text("  |  "))]
]
#v(6pt)

#section-heading("EXPERIENCE")
Software Engineer at Company X, 2020-2023
#v(0.01em)