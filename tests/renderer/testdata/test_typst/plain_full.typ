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
  [#connection-with-icon("location-dot")[Istanbul, Turkey]],
  [#link("mailto:john_doe@example.com", icon: false, if-underline: false, if-color: false)[#connection-with-icon("envelope")[john\_doe\@example.com]]],
  [#link("+905419999999", icon: false, if-underline: false, if-color: false)[#connection-with-icon("phone")[+905419999999]]],
  [#link("https://example.com/", icon: false, if-underline: false, if-color: false)[#connection-with-icon("link")[example.com]]],
  [#link("https://linkedin.com/in/johndoe", icon: false, if-underline: false, if-color: false)[#connection-with-icon("linkedin")[johndoe]]],
  [#link("https://github.com/johndoe", icon: false, if-underline: false, if-color: false)[#connection-with-icon("github")[johndoe]]],
  [#link("https://imdb.com/name/nm0000001", icon: false, if-underline: false, if-color: false)[#connection-with-icon("imdb")[nm0000001]]],
  [#link("https://instagram.com/johndoe", icon: false, if-underline: false, if-color: false)[#connection-with-icon("instagram")[johndoe]]],
  [#link("https://orcid.org/0000-0000-0000-0000", icon: false, if-underline: false, if-color: false)[#connection-with-icon("orcid")[0000-0000-0000-0000]]],
  [#link("https://scholar.google.com/citations?user=F8IyYrQAAAAJ", icon: false, if-underline: false, if-color: false)[#connection-with-icon("graduation-cap")[Google Scholar]]],
  [#link("https://example.com/@johndoe", icon: false, if-underline: false, if-color: false)[#connection-with-icon("mastodon")[\@johndoe\@example.com]]],
  [#link("https://stackoverflow.com/users/12323/johndoe", icon: false, if-underline: false, if-color: false)[#connection-with-icon("stack-overflow")[12323\/johndoe]]],
  [#link("https://gitlab.com/johndoe", icon: false, if-underline: false, if-color: false)[#connection-with-icon("gitlab")[johndoe]]],
  [#link("https://researchgate.net/profile/johndoe", icon: false, if-underline: false, if-color: false)[#connection-with-icon("researchgate")[johndoe]]],
  [#link("https://youtube.com/@johndoe", icon: false, if-underline: false, if-color: false)[#connection-with-icon("youtube")[johndoe]]],
  [#link("https://t.me/johndoe", icon: false, if-underline: false, if-color: false)[#connection-with-icon("telegram")[johndoe]]],
  [#link("https://wa.me/+14155552671", icon: false, if-underline: false, if-color: false)[#connection-with-icon("whatsapp")[+14155552671]]],
  [#link("https://x.com/johndoe", icon: false, if-underline: false, if-color: false)[#connection-with-icon("x-twitter")[johndoe]]],
  [#link("https://bsky.app/profile/johndoe.bsky.social", icon: false, if-underline: false, if-color: false)[#connection-with-icon("bluesky")[johndoe.bsky.social]]],
  [#link("https://reddit.com/user/johndoe", icon: false, if-underline: false, if-color: false)[#connection-with-icon("reddit")[johndoe]]],
)
#align(center)[
  #text(size: 28pt, weight: "bold", fill: rgb(0, 0, 0))[John Doe]
  #v(2pt)
  #text(size: 10pt)[#contact().join(text("  |  "))]
]
#v(8pt)

#section-heading("TEXT ENTRIES")
This is a #emph[TextEntry]. It is only a text and can be useful for sections like #strong[Summary]. To showcase the TextEntry completely, this sentence is added, but it doesn't contain any information.

Another text entry with #emph[markdown] and #strong[bold] text. This is the second text entry.

Third text with #link("https://example.com")[link] and more content.
#v(0.01em)
#section-heading("PUBLICATION ENTRIES")
#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    []
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
]
#v(8pt)

#block[
  #entry-line(
    [Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname — IEEE Transactions on Applied Superconductivity]
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)
#v(0.01em)
#section-heading("EXPERIENCE ENTRIES")
#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    []
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2015 - present]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [June 2020]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    []
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    []
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    []
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2015 - June 2020]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2015 - present]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2015 - present]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2015 - present]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [June 2020]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    []
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    []
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    []
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2015 - June 2020]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2015 - June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2015 - June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2015 - present]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2015 - present]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2015 - present]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    []
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2015 - June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2015 - June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2015 - June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2015 - present]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2015 - June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[Software Engineer]
  #linebreak()
  #entry-line(
    [Some Company | Istanbul, Turkey],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)
#v(0.01em)
#section-heading("EDUCATION ENTRIES")
#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    []
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    []
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - present]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [June 2020]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | ]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    []
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    []
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - present]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [June 2020]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | ]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    []
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    []
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - June 2020]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - present]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - present]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - present]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | June 2020]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | ]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | ]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    []
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - June 2020]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - present]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - present]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - present]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | June 2020]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | ]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | ]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    []
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - June 2020]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - present]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - present]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - present]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | ]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - June 2020]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - present]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - present]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - present]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | ]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - present]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2015 - June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - present]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2015 - June 2020]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[None]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #text(weight: "bold", size: 11pt)[BS]
  #linebreak()
  #entry-line(
    [Boğaziçi University — Mechanical Engineering],
    [Istanbul, Turkey | Sept 2021]
  )
  #v(2pt)
  Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)
#v(0.01em)
#section-heading("NORMAL ENTRIES")
#block[
  #entry-line(
    [My Project],
    []
  )
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - present]
  )
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [June 2020]
  )
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    []
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    []
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    []
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - June 2020]
  )
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - present]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - present]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - present]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [June 2020]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [June 2020]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    []
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    []
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    []
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - June 2020]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - June 2020]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - June 2020]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - present]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - present]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - present]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [June 2020]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [June 2020]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [June 2020]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    []
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - June 2020]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - June 2020]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - June 2020]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - present]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [June 2020]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2015 - June 2020]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)

#block[
  #entry-line(
    [My Project],
    [Sept 2021]
  )
  #v(-8pt)
  #text(style: "italic")[Istanbul, Turkey — Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.]
  #v(2pt)
  - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
]
#v(8pt)
#v(0.01em)
#section-heading("ONE LINE ENTRIES")
- *Programming*: Python, C++, JavaScript, MATLAB

- *Programming*: Python, C++, JavaScript, MATLAB
#v(0.01em)
#section-heading("BULLET ENTRIES")
- This is a bullet entry.

- This is a bullet entry.
#v(0.01em)
#section-heading("NUMBERED ENTRIES")
+ This is a numbered entry.

+ This is a numbered entry.
#v(0.01em)
#section-heading("REVERSED NUMBERED ENTRIES")
#reversed-numbered-entries(
  [

+ This is a reversed numbered entry.

+ This is a reversed numbered entry.

+ This is a reversed numbered entry.
  ],
)
#v(0.01em)
#section-heading("A SECTION & WITH \% SPECIAL CHARACTERS")
#block[
  #entry-line(
    [A Section & with \% Special Characters],
    []
  )
]
#v(8pt)
#v(0.01em)
#section-heading("EMPTY SECTION")

#v(0.01em)