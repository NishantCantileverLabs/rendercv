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

  image("profile_picture.jpg", width: 2cm),

  [
    #text(size: 15pt)[John Doe] \
Contact No: +905419999999 \ Email: john_doe\@example.com \   ],

  align(right)[
    #grid(
      columns: (auto, auto),
      column-gutter: 2mm,
      align(right + horizon)[Indian Institute of \ Technology \ Roorkee],
      image("logo.svg", width: 2cm)
    )
  ]
)

#section("Text Entries")


- This is a #emph[TextEntry]. It is only a text and can be useful for sections like #strong[Summary]. To showcase the TextEntry completely, this sentence is added, but it doesn't contain any information.

- Another text entry with #emph[markdown] and #strong[bold] text. This is the second text entry.

- Third text with #link("https://example.com")[link] and more content.

#section("Publication Entries")


- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, 

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *None*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, Sept 2021

- J. Doe, #strong[#emph[H. Tom]], S. Doe, A. Andsurname, S. Doe, A. Andsurname, "Magneto-Thermal Thin Shell Approximation for 3D Finite Element Analysis of No-Insulation Coils", in *IEEE Transactions on Applied Superconductivity*, Sept 2021

#section("Experience Entries")


#entry(
  [Software Engineer],
  [Some Company],
  [],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – present],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [June 2020],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – June 2020],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – present],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – present],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – present],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [June 2020],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [June 2020],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – June 2020],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – June 2020],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – present],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – present],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – present],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [June 2020],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – June 2020],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – present],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2015 – June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [Software Engineer],
  [Some Company],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#section("Education Entries")

#table(
  columns: (auto, auto, 1fr, auto),
  align: (col, row) => {
    if row == 0 { center + horizon }
    else { (center, left, left, center).at(col) + horizon }
  },
  stroke: 0.5pt,
  [Year], [Degree/Examination], [Institution/Board], [CGPA/ \ Percentage],

[  ],
[ None ],
[ Boğaziçi University ],
[   ],

[  ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ present ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[  ],
[ None ],
[ Boğaziçi University ],
[   ],

[  ],
[ None ],
[ Boğaziçi University ],
[   ],

[  ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ present ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[  ],
[ BS ],
[ Boğaziçi University ],
[   ],

[  ],
[ BS ],
[ Boğaziçi University ],
[   ],

[  ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ present ],
[ None ],
[ Boğaziçi University ],
[   ],

[ present ],
[ None ],
[ Boğaziçi University ],
[   ],

[ present ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[  ],
[ None ],
[ Boğaziçi University ],
[   ],

[  ],
[ None ],
[ Boğaziçi University ],
[   ],

[  ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ present ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ present ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ present ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[  ],
[ BS ],
[ Boğaziçi University ],
[   ],

[  ],
[ BS ],
[ Boğaziçi University ],
[   ],

[  ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ present ],
[ None ],
[ Boğaziçi University ],
[   ],

[ present ],
[ None ],
[ Boğaziçi University ],
[   ],

[ present ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[  ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ present ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ present ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ present ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[  ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ present ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ present ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ June 2020 ],
[ BS ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ None ],
[ Boğaziçi University ],
[   ],

[ Sept 2021 ],
[ BS ],
[ Boğaziçi University ],
[   ],
)

#section("Normal Entries")


#entry(
  [My Project],
  [],
  [],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2015 – present],
  [
  ]
)

#entry(
  [My Project],
  [],
  [June 2020],
  [
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [],
  [
  ]
)

#entry(
  [My Project],
  [],
  [],
  [
  ]
)

#entry(
  [My Project],
  [],
  [],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2015 – June 2020],
  [
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2015 – present],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2015 – present],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2015 – present],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [June 2020],
  [
  ]
)

#entry(
  [My Project],
  [],
  [June 2020],
  [
  ]
)

#entry(
  [My Project],
  [],
  [June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [],
  [
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [],
  [],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2015 – June 2020],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2015 – June 2020],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2015 – June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2015 – present],
  [
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2015 – present],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2015 – present],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [June 2020],
  [
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [],
  [June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2015 – June 2020],
  [
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2015 – June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2015 – June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2015 – present],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2015 – June 2020],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#entry(
  [My Project],
  [Istanbul, Turkey],
  [Sept 2021],
  [
    - Did #emph[this] and this is a #strong[bold] #link("https://example.com")[link]. But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. - Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
    - Did that. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.
  ]
)

#section("One Line Entries")

#grid(
  columns: (22%, 1fr),
  column-gutter: 1em,
  row-gutter: 1.5mm,

align(right)[Programming],
align(left)[Python, C++, JavaScript, MATLAB],


align(right)[Programming],
align(left)[Python, C++, JavaScript, MATLAB],

)

#section("Bullet Entries")


- This is a bullet entry.

- This is a bullet entry.

#section("Numbered Entries")


+ This is a numbered entry.

+ This is a numbered entry.

#section("Reversed Numbered Entries")


+ This is a reversed numbered entry.

+ This is a reversed numbered entry.

+ This is a reversed numbered entry.

#section("A Section & with \% Special Characters")


#entry(
  [A Section & with \% Special Characters],
  [],
  [],
  [
  ]
)

#section("Empty Section")



