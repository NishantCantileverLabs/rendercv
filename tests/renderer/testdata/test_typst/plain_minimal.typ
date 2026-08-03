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
  font: ("Arial", "Helvetica", "Liberation Sans", "sans-serif"),
  size: 10pt,
  fill: rgb(0, 0, 0),
)

// Paragraph justification for the summary
#set par(justify: true)

// --- Helpers ---

// Section headings with a bottom border
#let section-heading(title) = {
  v(12pt)
  text(size: 14pt, weight: "bold", fill: rgb(0, 0, 0))[#title]
  v(-8pt)
  line(length: 100%, stroke: 0.8pt + rgb(0, 0, 0))
  v(4pt)
}

// Two-column line: title left, date/place right
#let entry-line(title, right) = {
  grid(
    columns: (1fr, auto),
    text(weight: "bold")[#title],
    text(weight: "bold")[#right]
  )
}

#let contact() = (
)
#align(center)[
  #text(size: 28pt, weight: "bold", fill: rgb(0, 0, 0))[John Doe]
  #v(2pt)
  #text(size: 10pt)[#contact().join(text("  |  "))]
]
#v(8pt)

#section-heading("EXPERIENCE")
Software Engineer at Company X, 2020-2023
#v(0.01em)