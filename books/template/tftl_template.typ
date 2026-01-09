// tftl_template.typ
// Template for "Tales From The Loop" scenarios

// --- Colors ---
#let tfl-orange = rgb("#e57421")
#let tfl-yellow = rgb("#f0b040")
#let tfl-black = rgb("#1a1a1a")
#let tfl-text = rgb("#231f20")
#let tfl-paper = rgb("#f8f5f0")
#let tfl-table-dark = rgb("#FFDD9D")
#let tfl-table-light = rgb("#FFF8E8")

// --- Fonts ---
// Using static fonts only (variable fonts are not supported by Typst)
#let font-body = "Libre Baskerville"
#let font-heading = "Archivo"
#let font-mono = "Courier Prime"
#let font-handwritten = "Special Elite"

// --- Inline Text Styles ---
// Keyword: Highlighted term in orange (for important game terms, locations, etc.)
#let keyword(body) = text(fill: tfl-orange, weight: "bold", body)

// Danger: Red warning text
#let danger(body) = text(fill: rgb("#cc2222"), weight: "bold", body)

// Small caps for emphasis
#let sc(body) = smallcaps(body)

// --- Components ---

// Strategy/Tactics Box
#let tactics(body) = {
  block(
    fill: gradient.linear(rgb("#FFF8E8"), rgb("#FFEED0"), angle: 135deg),
    stroke: 2pt + tfl-orange,
    inset: 15pt,
    width: 100%,
    radius: 0pt,
    breakable: false,
    [
      #place(
        top + left,
        dy: -25pt,
        dx: -5pt,
        rect(fill: tfl-orange, inset: 4pt, radius: 0pt)[
          #text(fill: white, font: font-heading, weight: "bold", size: 9pt, tracking: 1pt)[⚔️ STRATÉGIE]
        ]
      )
      #body
    ]
  )
}

// Scenario Info Box
#let scenario-info(body) = {
  block(
    fill: tfl-orange.lighten(90%),
    stroke: (left: 5pt + tfl-orange, rest: 2pt + tfl-orange),
    inset: (x: 15pt, y: 10pt),
    width: 100%,
    body
  )
}

// GM Note / Blockquote
#let note(body) = {
  block(
    fill: tfl-orange.lighten(92%),
    stroke: (left: 4pt + tfl-orange),
    inset: (left: 15pt, top: 10pt, bottom: 10pt, right: 10pt),
    width: 100%,
    body
  )
}

// Secret / GM Eyes Only
#let secret(body) = {
  block(
    fill: rgb("#4b6584"), // Lighter Blue-Grey
    stroke: (left: 4pt + tfl-yellow),
    inset: (left: 15pt, top: 10pt, bottom: 10pt, right: 10pt),
    width: 100%,
    radius: (right: 4pt),
    [
      #place(
        top + right,
        dy: -5pt,
        text(fill: tfl-yellow.lighten(20%), size: 10pt, font: font-heading, weight: "bold", tracking: 1pt)[TOP SECRET]
      )
      #text(fill: white, body)
    ]
  )
}

// Quote / Dialogue Box
// Alias block function to avoid shadowing by argument name
#let std-block = block
#let quote(body, block: false, attribution: none) = {
  pad(y: 10pt, std-block(
    fill: rgb("#f9f9f9"),
    stroke: (left: 4pt + tfl-orange),
    inset: (left: 15pt, top: 10pt, bottom: 10pt, right: 10pt),
    width: 100%,
    radius: (right: 4pt),
    [
      #set text(style: "italic", fill: rgb("#333333"))
      #show strong: set text(weight: "bold", style: "normal")
      #body
    ]
  ))
}

// Handout: Letter
#let letter(body) = {
  rotate(-0.5deg,
    block(
      fill: rgb("#fffcf4"),
      stroke: 1pt + rgb("#c8b89a"),
      inset: 20pt,
      width: 100%,
      radius: 0pt,
      breakable: false,
      text(font: font-mono, size: 10pt, fill: rgb("#333333"), body)
    )
  )
}

// Handout: Blueprint
#let blueprint(body) = {
  block(
    fill: rgb("#003366"),
    stroke: 4pt + white,
    inset: 15pt,
    width: 100%,
    breakable: false,
    [
      #set text(font: font-mono, fill: rgb("#e0f0ff"))
      #show list: set text(fill: rgb("#e0f0ff"))
      #body
    ]
  )
}

// Handout: Report
#let report(body) = {
  block(
    fill: rgb("#f4f4f4"),
    stroke: 2pt + rgb("#333333"),
    inset: 20pt,
    width: 100%,
    breakable: false,
    clip: true,
    [
      #place(
        top + right,
        dy: -5pt,
        rotate(-15deg, 
          rect(stroke: 3pt + rgb(255, 0, 0, 50), inset: 5pt)[
            #text(fill: rgb(255, 0, 0, 50), size: 18pt, weight: "bold")[CONFIDENTIAL]
          ]
        )
      )
      #text(font: font-handwritten, fill: rgb("#111111"), body)
    ]
  )
}

// Sticky Note (Post-it)
#let sticky-note(body, rotation: -2deg) = {
  rotate(rotation)[
    #block(
      fill: rgb("#fff740"),
      inset: 20pt,
      width: 60%,
      radius: 0pt,
      stroke: (bottom: 4pt + rgb("#dcc600"), right: 4pt + rgb("#dcc600"), rest: 0pt),
      [
        #set text(font: font-handwritten, size: 14pt, fill: rgb("#1a1a1a"))
        #body
      ]
    )
  ]
}

// Shadow Block for images/content
#let shadow-block(body, rotation: 0deg) = {
  rotate(rotation)[
    #block(
      stroke: (bottom: 8pt + rgb("#cccccc"), right: 8pt + rgb("#cccccc"), rest: 2pt + rgb("#eeeeee")),
      radius: 0pt,
      width: 100%, 
      body
    )
  ]
}

// Main Template Function
#let project(
  title: "",
  doc
) = {
  set page(
    paper: "a4",
    margin: (left: 2cm, right: 2cm, top: 1.5cm, bottom: 2cm),
    background: {
      place(left, rect(fill: tfl-orange, width: 30pt, height: 100%))
      place(left, dx: 30pt, rect(fill: tfl-yellow, width: 10pt, height: 100%))
    },
    footer: context [
      #place(
        bottom + right,
        dx: -1cm,
        dy: -1cm,
        text(font: font-heading, fill: tfl-orange, size: 12pt, weight: "bold")[
           #counter(page).display()
        ]
      )
    ]
  )

  set text(
    font: font-body,
    size: 10pt,
    lang: "fr",
    fill: tfl-black
  )

  set par(
    justify: true,
    leading: 1.0em,
    spacing: 1.5em
  )

  // Heading Styles
  show heading.where(level: 1): it => {
    // colbreak() REMOVED to prevent empty first page
    set text(font: font-heading, weight: "bold", size: 24pt, fill: tfl-orange)
    block(
      width: 100%,
      stroke: (bottom: 4pt + tfl-orange),
      inset: (bottom: 15pt),
      above: 30pt,
      below: 30pt,
      upper(it.body)
    )
  }

  show heading.where(level: 2): it => {
    set text(font: font-heading, weight: "bold", size: 18pt, fill: tfl-orange)
    block(
      width: 100%,
      stroke: (bottom: 2pt + tfl-orange),
      inset: (bottom: 12pt),
      above: 30pt,
      below: 20pt,
      upper(it.body)
    )
  }

  show heading.where(level: 3): it => {
    set text(font: font-heading, weight: "bold", size: 13pt, fill: tfl-orange)
    block(
      width: 100%,
      stroke: (bottom: 1pt + tfl-orange),
      inset: (bottom: 8pt),
      above: 25pt,
      below: 15pt,
      it.body
    )
  }
  
  show heading.where(level: 4): it => {
    set text(font: font-heading, size: 11pt, fill: tfl-black, weight: "bold")
    block(
      stroke: (left: 4pt + tfl-orange),
      inset: (left: 10pt),
      above: 20pt,
      below: 15pt,
      it.body
    )
  }

  // Lists
  set list(marker: ([▪], [◦]))

  // Two columns layout REMOVED - will be applied manually in main.typ
  // show: rest => columns(2, gutter: 1cm, rest)

  doc
}

#let prop(body, to: none) = {
  let element = box(
    fill: rgb("#f3f3f3ff"), 
    stroke: 1pt + rgb("#ccccccff"), 
    inset: (x: 5pt, y: 0pt), 
    radius: 4pt, 
    outset: (y: 3pt),
    text(font: font-mono, size: 0.8em, weight: "bold", fill: rgb("#333333"), body)
  )

  if to != none {
    link(to, element)
  } else {
    element
  }
}
