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
  font: ("Helvetica", "Arial", "Liberation Sans", "sans-serif"),
  size: 10pt,
  fill: rgb(0, 0, 0),
)

// Define the custom accent color
#let primary-color = rgb(106, 90, 158)

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
    #text(size: 12pt, weight: "bold", fill: rgb(106, 90, 158))[#title]
    #v(-8pt)
    #line(length: 100%, stroke: 0.8pt + rgb(106, 90, 158))
    #v(4pt)
  ]
}

// Standard Entry Formatting (title/location left, subtitle/date right)
// The block keeps the whole entry on a single page instead of letting it
// split across a page break.
#let cv-entry(title, location, subtitle, date, body: none) = {
  block(breakable: false)[
    #grid(
      columns: (1fr, auto),
      text(weight: "bold")[#title],
      text()[#location]
    )
    #v(-8pt)
    #grid(
      columns: (1fr, auto),
      text()[#subtitle],
      text()[#date]
    )
    #if body != none {
      v(-4pt)
      body
    }
    #v(4pt)
  ]
}

#let contact() = (
)
#align(center)[
  #text(size: 22pt, weight: "bold", fill: rgb(106, 90, 158))[JOHN DOE]
  #v(2pt)
  #text(size: 10pt)[#contact().join(text("  |  "))]
]
#v(8pt)

#section-heading("Experience")
Software Engineer at Company X, 2020-2023
#v(0.01em)