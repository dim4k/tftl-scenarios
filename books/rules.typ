#import "template/tftl_template.typ": *

// Setup page for the specific layout
#set page(
  paper: "a4",
  margin: (x: 1cm, y: 0.8cm), 
  footer: none,
  header: none,
  background: none 
)

// Define the content as a variable to reuse it
#let rules_content = {
  set text(font: font-body, size: 8.5pt, fill: tfl-black) 
  set par(leading: 0.6em, spacing: 0.7em, justify: true) 
  
  // Custom styles
  let section-header(number, title) = {
    block(below: 8pt, above: 12pt, width: 100%)[
      #box(fill: tfl-orange, inset: (x: 6pt, y: 3pt), radius: 2pt)[
        #text(font: font-heading, weight: "black", size: 10pt, fill: white)[#number]
      ]
      #h(4pt)
      #text(font: font-heading, weight: "black", size: 12pt, fill: tfl-orange)[#title]
      #v(-4pt)
      #line(length: 100%, stroke: 1pt + tfl-orange)
    ]
  }

  let sub-header(title) = {
    text(font: font-heading, weight: "bold", size: 9.5pt, fill: tfl-black, upper(title))
  }

  // Header Banner
  align(center)[
    #block(fill: tfl-black, inset: 8pt, radius: 4pt, width: 100%)[
      #text(font: font-heading, size: 16pt, weight: "black", fill: white)[TALES FROM THE LOOP]
      #h(1em)
      #text(font: font-handwritten, size: 12pt, weight: "bold", fill: tfl-orange)[RÉSUMÉ DES RÈGLES]
    ]
  ]
  
  v(1em)

  // Use a grid for balanced columns
  grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    [
      // COLUMN 1
      #section-header("1", "LE COEUR DU SYSTÈME")
      Tout se joue avec des *D6*. Il n'y a pas d'autres dés.
      
      #sub-header("Le Jet de Base") \
      Pour une action risquée, lancez une réserve de dés :
      #align(center)[#box(fill: tfl-table-light, inset: 6pt, radius: 4pt, stroke: 0.5pt + tfl-orange)[
        *Dés = Attribut + Compétence + Outil*
      ]]
      
      #list(marker: text(fill: tfl-orange)[★])[
        *Succès :* Il suffit d'un seul *6*.
        *Expertise :* Les *6* supplémentaires achètent des effets bonus (vitesse, aide, dégâts...).
      ]
      
      #section-header("2", "LES ENFANTS (10-15 ANS)")
      
      #sub-header("Attributs & Compétences") \
      *4 Attributs :* Physique, Technique, Cœur, Esprit. \
      *Compétences :* 3 par attribut (12 total).
      
      #sub-header("Points & Chance")
      #list(marker: [▪])[
        *Points d'Attributs* = Âge de l'enfant.
        *Points de Chance* = 15 - Âge.
      ]
      _Dépensez 1 point de Chance pour relancer un jet raté._
      
      #section-header("3", "L'ÉCHEC & POUSSER")
      Pas de 6 ? L'action échoue. Mais vous avez une seconde chance.
      
      #sub-header("Pousser le Jet") \
      Vous pouvez relancer *tous* les dés qui ne sont pas des 6.
      *Coût :* Vous devez cocher une *Condition*. \
      _Cela représente l'épuisement, la peur ou le stress._
    ],
    [
      // COLUMN 2
      #section-header("4", "SANTÉ ET CONDITIONS")
      On ne meurt pas dans TftL. On s'épuise.
      
      #sub-header("Les 4 Conditions") \
      Cochez-les dans l'ordre (dégâts ou en poussant un jet) :
      #v(0.3em)
      #let button(content: "") = box(stroke: 1pt + tfl-black, inset: 3pt, radius: 2pt)[#text(size:8pt)[#content]]
      #stack(dir: ltr, spacing: 1em,
        button(content: "Contrarié"),
        button(content: "Effrayé"),
        button(content: "Épuisé"),
        button(content: "Blessé")
      )

      #v(0.5em)
      *Malus :* Chaque condition cochée = *-1 dé* à tous les jets. \
      *Brisé :* Si tout est coché. L'enfant ne peut plus agir.
      
      #sub-header("Guérir")
      #list(marker: text(fill: tfl-orange)[♥])[
        *Scène avec un autre enfant* (réconfort).
        *Scène avec l'Ancrage* (adulte de confiance).
        *Repos au Repaire*.
      ]
      
      #section-header("5", "LEVIERS NARRATIFS")
      #list(marker: [▸])[
        *Objet Fétiche :* +2 dés (1x/scène).
        *Fierté :* Réussite Auto (1x/séance).
        *Problème :* Donne de l'XP si joué.
        *Ancrage :* PNJ clé pour guérir.
      ]
      
      #v(1em)
      #block(fill: tfl-orange.lighten(90%), stroke: (left: 4pt + tfl-orange), inset: 8pt, radius: 0pt, width: 100%)[
        #text(weight: "bold", fill: tfl-orange)[CE QU'IL FAUT RETENIR] \
        On réussit souvent, mais la tension vient de l'accumulation des *Conditions*. \
        L'ambiance est un mélange de *merveille* et de *mélancolie*.
        
        #align(right)[_C'est les années 80 qui n'ont jamais existé._]
      ]
    ]
  )
}

// Master Layout
#grid(
  rows: (48%, 4%, 48%), 
  columns: (1fr),
  
  // Top Copy
  box(height: 100%, clip: true)[
    #rules_content
  ],
  
  // Separator
  align(center + horizon)[
    #line(length: 100%, stroke: (dash: "dashed", thickness: 0.5pt, paint: gray))
  ],

  // Bottom Copy
  box(height: 100%, clip: true)[
    #rules_content
  ]
)
