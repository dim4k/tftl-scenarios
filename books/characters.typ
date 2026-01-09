#import "template/tftl_template.typ": *
#import "@preview/wrap-it:0.1.1": wrap-content

#show: doc => project(
  title: "Livre des Personnages",
  doc
)

// --- TITLE PAGE ---
#page(margin: 0cm, footer: none)[
  #pad(x: 3cm, top: 4cm, bottom: 2cm)[
    
    // Title Section
    #block(below: 2cm)[
      #par(leading: 0.4em)[
        #text(fill: tfl-orange, size: 50pt, weight: "black", font: font-heading)[LIVRE DES \ PERSONNAGES]
      ]
      #v(2cm)
      #text(size: 20pt, font: font-heading, weight: "black", fill: tfl-black)[Les Enfants du Loop]
      #v(0.1cm)
      #text(size: 16pt, style: "italic", fill: gray)[Recueil de Personnages Prétirés]
    ]

    // Separator
    #line(length: 100%, stroke: 2pt + tfl-orange)
    #v(1cm)

    // Intro Text - formatted nicely
    #columns(2, gutter: 1cm)[
      #set par(justify: true, first-line-indent: 0em)
      #set text(size: 11pt)
      
      *Ce recueil présente cinq adolescents prêts à jouer.* Chacun porte ses propres secrets, ses peurs et ses rêves. Ensemble, ils forment un groupe soudé par l'amitié et la curiosité — une bande de gamins ordinaires confrontés à l'extraordinaire.
      
      #v(1em)
      *Astoria, Oregon. Années 80.*
      Les tours de refroidissement du Loop dominent l'horizon, leurs silhouettes massives découpées contre le ciel gris du Pacifique. Elles ronronnent jour et nuit, ce bourdonnement grave qui fait vibrer les carreaux et berce le sommeil des adultes insouciants. 
      
      #colbreak()
      
      Mais les enfants savent. Ils voient les lumières bleues dans la nuit. Ils entendent les bruits étranges. Ils sentent le picotement électrique sur leur peau quand ils s'approchent trop près.

      #v(1em)
      Ces cinq amis ont grandi dans l'ombre du Loop. Ils ont partagé leurs jeux, leurs peines et leurs premiers émois. Aujourd'hui, que ce soit pour résoudre un mystère local, retrouver un objet perdu ou explorer une zone interdite, ils peuvent compter les uns sur les autres.
      
      *Ils sont les Enfants du Loop.*
    ]
  ]
]

// --- HELPER COMPONENT: POLAROID ---
#let tfl-polaroid(image-path, caption, rotation: -2deg, width: 100%) = {
  rotate(rotation)[
    #block(
      fill: white,
      width: width,
      inset: 0pt,
      stroke: none,
      radius: 0pt,
      [
        #block(
          stroke: (bottom: 4pt + rgb("#cccccc"), right: 4pt + rgb("#cccccc"), rest: 1pt + rgb("#eeeeee")), // Shadow simulation
          inset: (top: 15pt, left: 15pt, right: 15pt, bottom: 50pt),
          fill: white,
          radius: 0pt,
          width: 100%,
          [
            #image("assets/characters/" + image-path, width: 100%)
            #place(bottom + center, dy: 35pt)[
              #text(font: font-handwritten, size: 14pt, fill: rgb("#222222"))[#caption]
            ]
          ]
        )
      ]
    )
  ]
}


// --- CHARACTER TEMPLATE ---
#let character-sheet(
  name: "", 
  archetype: "", 
  image-path: "", 
  bio: [],
  quote-text: ""
) = {
  pagebreak()
  
  // Header: Name & Archetype
  v(10pt)
  block(width: 100%, below: 30pt)[
    #text(font: font-heading, size: 32pt, weight: "bold", fill: tfl-orange)[#name] \
    #v(0.2em)
    #text(font: font-handwritten, size: 20pt, weight: "bold", fill: tfl-black)[-- #archetype --]
  ]

  // Main Content: Automatic Wrapping
  // Using fixed width for predictable wrapping behavior
  let polaroid-block = tfl-polaroid(image-path, name, rotation: -2deg, width: 5cm)

  // Wrap content logic
  // wrap-content(figure, body, align: right, column-gutter: ...)
  wrap-content(
    polaroid-block,
    [
      #set par(justify: true, leading: 0.8em, spacing: 1.2em)
      #set text(size: 11pt)
      #bio
    ],
    align: right,
    column-gutter: 2em
  )
  
  v(1fr)
  
  // Footer: Quote
  quote(block: true)[
    #text(size: 11pt, style: "italic")[#quote-text]
  ]
  v(1fr)
}


// --- CHARACTERS ---

#character-sheet(
  name: "Sofia Eriksson", 
  archetype: "L'Intello", 
  image-path: "sofia.jpg",
  bio: [
    Sofia a toujours su qu'elle était différente. À quatorze ans, elle dévore des manuels de physique quantique pendant que ses camarades s'extasient sur les derniers clips de MTV. Ses cheveux noirs noués en queue-de-cheval, ses lunettes rondes et sa veste en velours côtelé lui donnent l'air d'une petite professeure égarée dans un collège de banlieue. Elle traîne toujours un carnet à spirales rempli d'équations griffonnées et de questions sans réponse.
    
    Ses parents, le Dr. Erik Eriksson et sa femme, sont tous deux chercheurs au Loop. Ils passent plus de temps dans leurs laboratoires souterrains qu'à la maison, laissant Sofia seule avec ses livres et ses expériences. Elle a grandi bercée par le bourdonnement lointain des réacteurs à particules et les conversations cryptiques sur les "anomalies de phase" qu'elle surprenait au dîner — les rares fois où ses parents rentraient avant minuit.
    
    Sofia veut prouver qu'elle est plus intelligente qu'eux. Pas par orgueil, mais parce que personne ne la prend au sérieux à cause de son âge. À l'école, Mme. Lindström, sa prof de maths, la traite avec une condescendance exaspérante. "Tu comprendras quand tu seras plus grande, ma chérie." Sofia déteste cette phrase plus que tout.
    
    Sa plus grande fierté ? Avoir construit un détecteur de radiations fonctionnel avec une vieille montre de son grand-père et des composants récupérés dans la casse. Elle a passé trois week-ends à souder des circuits et à calibrer les capteurs.
    
    Le laboratoire abandonné au sous-sol du lycée est son repaire secret. C'est là qu'elle garde ses instruments et sa collection de magazines scientifiques "empruntés" à son père. Elle y passe des heures à analyser des échantillons de roche étranges ou à écouter les fréquences radio cryptées du Loop. Elle est persuadée que l'Agence cache quelque chose de gros, et elle compte bien le découvrir.
    
    Lucas est son meilleur ami depuis l'enfance. Ils se sont rencontrés à la bibliothèque à sept ans, tous deux trop jeunes pour comprendre les livres qu'ils feuilletaient, mais assez curieux pour essayer. Lucas lui avait tendu un traité sur les trous noirs. "Tu sais lire ça ?" Sofia avait menti et dit oui. Depuis, ils sont inséparables, unis par cette soif de comprendre l'inconnu.
  ],
  quote-text: "La science explique tout. Même les choses impossibles. Il suffit de trouver la bonne équation."
)

#character-sheet(
  name: "Marcus \"Mack\" Johnson",
  archetype: "Le Sportif",
  image-path: "mack.jpg",
  bio: [
    Mack n'a que treize ans, mais il a déjà les épaules d'un gars de seize. Grand, musclé, les genoux perpétuellement écorchés et une casquette vissée à l'envers sur le crâne, il incarne le prototype du gamin qui a grandi trop vite dans un quartier où la tendresse était un luxe.
    
    Il vit avec sa mère dans un petit appartement au-dessus du pressing, sur la 8ème Avenue. Elle travaille de nuit à l'usine de poisson sur les quais d'Astoria. Elle rentre à l'aube, épuisée, les mains gercées par le froid des chambres frigorifiques. Mack se lève avant elle pour préparer le petit-déjeuner. Il fait chauffer le café, grille deux tartines, et laisse un mot : "Bonne nuit maman. Je t'aime." Il ne le dit jamais en face.
    
    Le terrain de basket désaffecté près de la voie ferrée est son royaume. C'est là qu'il s'entraîne, qu'il défoule sa rage contre les panneaux rouillés. Son skateboard customisé — roulements huilés, grip tape noir — est son moyen de transport et son meilleur ami silencieux.
    
    Le Coach Reynolds est le seul adulte qui croit en lui. Quand Mack a été suspendu pour cette bagarre — _ce n'était pas sa faute, l'autre type avait insulté sa mère devant tout le monde_ — c'est le Coach qui a plaidé sa cause. "Ce gosse a du potentiel. Il a juste besoin d'une vraie chance." La suspension a été réduite à trois jours.
    
    Mack cache une peur secrète : l'abandon. Son père est parti quand il avait six ans. Une nuit, sans un mot. Il se souvient encore du bruit de la porte qui claque et des phares qui disparaissent. Depuis, Mack protège férocement ceux qu'il aime. Lucas est comme un frère. Ils jouent au foot ensemble, bricolent des talkie-walkies, et partagent ce silence complice des vrais amis.
    
    L'année dernière, Mack a sauvé un chien coincé sous une voiture. Il a soulevé le pare-chocs à mains nues. Ses paumes se sont déchirées sur le métal rouillé, mais le chien était sauf. Il n'en a jamais parlé. C'est juste ce qu'on fait.
  ],
  quote-text: "Je m'en fiche de ce que c'est. Si ça menace mes potes, ça va le regretter."
)

#character-sheet(
  name: "Liam Carter",
  archetype: "Le Rockeur",
  image-path: "liam.jpg",
  bio: [
    Avec sa veste en jean couverte de badges — The Clash, Talking Heads, un "Nuclear Power? No Thanks" décoloré — ses cheveux longs et ses écouteurs orange vissés autour du cou, Liam incarne le rêve rock'n'roll des années 80. Sa guitare Fender cabossée ne le quitte jamais, branchée sur une batterie de voiture récupérée à la casse.
    
    À quatorze ans, il compose ses propres chansons dans le garage familial transformé en studio. Lucas joue de la batterie — mal, mais avec enthousiasme. Ensemble, ils forment "Les Échos du Vide", un nom que tout le monde oublie constamment. Leurs répétitions font hurler les voisins.
    
    Tout le collège fredonne sa chanson "Les Géants Endormis", une ballade sur les tours du Loop. _"Ils nous regardent dormir / Ils connaissent nos rêves / Ils attendent..."_ Personne ne sait que c'est lui qui l'a écrite. La gloire peut attendre.
    
    Mais derrière le rockeur insouciant se cache une blessure qui ne guérit pas. Son frère Alex a disparu près du Loop il y a deux ans, trois mois et six jours. Officiellement, une "fugue". Les adultes hochent la tête avec condescendance. Mais Alex avait dix-sept ans, un job d'été prévu, son permis à passer. Il n'aurait jamais fugué.
    
    M. Grimes, le gardien de la casse, lui a confié avoir vu Alex fouiller les épaves avant sa disparition. "Il cherchait quelque chose, gamin. Il avait l'air possédé." Cette révélation hante Liam. Qu'est-ce qu'Alex cherchait ? L'a-t-il trouvé ?
    
    Il est persuadé que le Loop est responsable. Il compose des hymnes à la révolte, espérant qu'un jour, sa musique fera s'écrouler les murs de l'Agence comme ceux de Jéricho. Le médaillon autour de son cou contient une photo d'Alex. Il le serre si fort que le métal s'imprime dans sa paume à chaque fois qu'il passe près des tours.
  ],
  quote-text: "Alex n'a pas fugué. Ils l'ont pris. Et je vais faire assez de bruit pour qu'ils le rendent."
)

#character-sheet(
  name: "Chloe Dubois",
  archetype: "La Discrète",
  image-path: "chloe.jpg",
  bio: [
    Chloe ne fait pas de bruit. Elle glisse dans les couloirs comme une ombre, son pull trop grand avalant sa silhouette, ses bottes en caoutchouc couinant sur le linoléum. Elle observe. Elle écoute. Elle _comprend_. Et surtout, elle photographie.
    
    Arrivée à Astoria il y a six mois après le divorce brutal de ses parents, Chloe a laissé derrière elle Portland, ses amis, et une version d'elle-même qui croyait encore que les familles restent ensemble. Sa mère a obtenu la garde. Son père a obtenu la maison. Chloe a obtenu une valise et un Polaroid SX-70 offert par sa grand-mère "pour capturer les moments heureux." L'ironie n'échappe à personne.
    
    Elle n'a pas d'amis ici. Les filles parlent de garçons et de maquillage. Les garçons jouent au foot. Chloe les observe depuis les marges, prenant des notes mentales sur leurs faiblesses. Ce n'est pas de la méchanceté. C'est de la survie.
    
    Puis Lucas l'a repérée un soir, photographiant les tours de refroidissement. Au lieu de se moquer, il lui a souri. "Tu veux voir un truc bizarre ?" Depuis, elle fait partie de la bande. Pas au centre — jamais au centre. Sur les bords, où elle peut observer sans être observée.
    
    Son Polaroid capture ce que les autres ne voient pas : le reflet d'une lumière bleue dans une flaque, l'expression fugace de peur sur un visage. Son carnet de croquis est rempli de portraits — pas de sourires convenus, mais de vérités silencieuses.
    
    Elle sait que tout le monde cache quelque chose. Lucas, Sofia, Mack... ils ont tous leurs fissures. Chloe est la gardienne de ces secrets. Elle ne juge pas. Elle documente. Car elle a appris une leçon dure : les souvenirs s'effacent, mais les photos restent. Et un jour, elles serviront de preuves.
  ],
  quote-text: "Les gens mentent avec leurs mots. Mais leurs yeux disent toujours la vérité."
)

#character-sheet(
  name: "Ethan Park",
  archetype: "Le Bricoleur",
  image-path: "ethan.jpg",
  bio: [
    Ethan sent l'huile de moteur et la soudure. À treize ans, ses mains sont calleuses, noircies par le cambouis, et ses lunettes de sécurité ne quittent jamais son front. Sa salopette tachée est un musée de ses expériences : traces de rouille, brûlures d'acide, et une mystérieuse tache violette dont même lui ne se souvient plus l'origine.
    
    Son sac à dos est une caverne d'Ali Baba : 
    
    multimètre, tournevis de toutes tailles, bobines de fil de cuivre, transistors récupérés. Et puis il y a Rusty un robot-jardinier miniature ressuscité avec des pièces de grille-pain. Il fonctionne trois fois sur cinq. Ethan considère ça comme un succès.
    
    Le garage familial est son sanctuaire. Les murs sont couverts d'étagères de pièces détachées et de posters de robots. C'est là qu'il a passé des centaines d'heures avec Lucas, bidouillant des circuits et rêvant de construire quelque chose qui changerait le monde.
    
    Son père, M. Park, est ingénieur au Loop. Un homme silencieux aux yeux fatigués qui refuse de parler de son travail. "C'est pour ton bien. Il y a des choses qu'il vaut mieux ne pas savoir." Mais Ethan a vu les dossiers marqués "RESTRICTED" sur le bureau paternel. Il a vu les schémas de machines qui défient la gravité.
    
    Vieux Joe, le tenancier de la casse, lui donne des pièces en échange de réparations. "T'as des doigts en or, gamin." La casse est son terrain de jeu. Chaque épave est une mine de trésors. Il connaît l'endroit comme sa poche, y compris le vieux bus scolaire qu'il utilise comme atelier secret avec Lucas pour leurs projets les plus ambitieux.
    
    Il sait que le Loop n'est pas juste une usine d'énergie. C'est une porte vers l'impossible. Et parfois, l'impossible a besoin d'être réparé... ou arrêté. Ethan garde toujours son tournevis à portée de main. Au cas où.
  ],
  quote-text: "Je peux réparer n'importe quoi. Même la réalité, si j'ai le bon schéma."
)
