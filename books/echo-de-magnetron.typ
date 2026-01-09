#import "template/tftl_template.typ": *

#show: doc => project(
  title: "L'Écho du Magnétron",
  doc
)

// --- COVER PAGE ---
#page(margin: 0cm, footer: none)[
  // 1. Full Page Background Image
  #place(top, image("assets/scenarios/echo-de-magnetron/cover-2.jpg", width: 100%, height: 100%, fit: "cover"))

  // 2. Gradient Scrim for Readability (Bottom 50%)
  #place(bottom, rect(
    width: 100%, 
    height: 50%, 
    fill: gradient.linear(rgb(10, 10, 10, 0), rgb(5, 5, 5, 255), angle: 90deg)
  ))

  // 3. Top Header: Logo centered
  
  // Official Logo centered at top
  #place(top + center, dy: 1.5cm, 
    image("assets/scenarios/echo-de-magnetron/tftl-logo-white.png", width: 80%)
  )

  // 4. Bottom Typography
  #place(bottom + center, block(width: 90%, inset: (bottom: 2.5cm))[
    #align(center)[
      
      // Main Title
      #text(font: "Archivo", weight: "black", size: 32pt, fill: white, tracking: 8pt)[
        L'ÉCHO DU MAGNÉTRON
      ]
      
      #v(0.3cm)
      
      // Metadata (Restored)
      #text(font: "Archivo", weight: "bold", size: 10pt, fill: rgb("#f0b040"), tracking: 1pt)[
        3 À 4 HEURES  -  3 À 5 JOUEURS  -  MYSTÈRE & PARADOXE
      ]
    ]
  ])
]

#pagebreak()

// --- SOMMAIRE ---
= Sommaire
#columns(2)[
  #outline(title: none, indent: auto)
]

#pagebreak()

== Introduction
#quote(block: true)[
  C’est une soirée de novembre typique dans les quartiers résidentiels d'Astoria, Oregon. La pluie tombe en diagonale, glaciale et implacable, fouettant les fenêtres de vos chambres avec un bruit de mitraille. Les rues sont désertes, noyées sous les reflets orange des lampadaires au sodium. Au loin, les tours de refroidissement du Loop ronronnent doucement. Ce bourdonnement grave fait vibrer les carreaux et berce le sommeil des adultes.
  
  Mais pour vous, la nuit ne fait que commencer.
  Lucas, le cœur de votre groupe, votre meilleur ami, manque à l'appel. Ce matin, il avait les yeux brillants d'excitation. Il parlait à voix basse d’une "trouvaille incroyable" dénichée près de la vieille casse de Vieux Joe. \ "Un truc qui va changer l'histoire," avait-il chuchoté. \ \ Depuis la fin des cours, plus rien. Silence radio. Son talkie-walkie ne répond plus.
]

#note[
  *MÉCANIQUE SPÉCIALE : LES ÉTATS* \
  Dans cette aventure, la mort n'est pas une issue. Cependant, l'échec a un prix émotionnel et physique. Lorsqu'un joueur rate un jet ou subit un choc, il coche un *État* (-1 dé à tous les jets futurs) :
  - *Contrarié :* La frustration déborde. Le personnage se dispute pour un rien ou casse un objet précieux.
  - *Effrayé :* La terreur paralyse. Les mains tremblent, le personnage hésite à agir au moment critique.
  - *Épuisé :* Le froid et l'effort ont raison du corps. Le personnage est trempé jusqu'aux os, à bout de souffle.
  - *Blessé :* Une coupure, un bleu, une cheville tordue. La douleur est aiguë.

  Si un personnage cumule *4 États*, il est *Brisé* et ne peut plus agir pour le reste de la scène.
]

=== Le Contexte : Astoria, 1984
Astoria n'est pas une ville normale. C'est une ville portuaire de l'Oregon, coincée entre l'océan Pacifique gris acier et des forêts de sapins denses et humides. Mais ce qui la rend unique se trouve sous terre.

*Le Loop* est un accélérateur de particules massif, construit dans les profondeurs rocheuses de l'archipel. Depuis sa mise en service dans les années 60, la technologie a fait des bonds étranges. Des robots marcheurs côtoient des tracteurs rouillés, et des navires volants à magnétrine traversent le ciel brumeux.

==== L'Ambiance Visuelle
- *Le Temps :* Il pleut 300 jours par an. Le reste du temps, il y a du brouillard. Ce soir, c'est une tempête d'automne glaciale.
- *Les Sons :* Le grondement lointain du "Vent du Loop" (les ventilations souterraines), les cornes de brume des cargos, le crépitement des néons.
- *La Technologie :* C'est du "Retro-Futur". Les ordinateurs ont des écrans verts et pèsent une tonne. Les robots sont  bruyants, hydrauliques et sentent l'huile chaude.

==== Phénomènes Locaux
À Astoria, l'étrange est devenu banal. Les adultes l'ignorent, mais les enfants remarquent ces détails qui trahissent la présence du Loop sous leurs pieds :
- *Les Échos Magnétiques :* Parfois, les télévisions captent des émissions brouillées qui semblent venir du futur ou d'une autre réalité.
- *La Gravité Capricieuse :* Dans certaines zones de la forêt, on se sent plus léger. Les feuilles mortes ne tombent pas, elles flottent.
- *Les Machines Oubliées :* Des robots agricoles autonomes continuent de labourer les mêmes champs abandonnés nuit après nuit, suivant une programmation obsolète.
- *L'Eau Métallique :* Quand le Loop est en pleine activité, l'eau du robinet a un goût de cuivre et fait tinter les dents.

==== Lieux Clés d'Astoria
- *Les Tours de Refroidissement :* Trois immenses tours de béton qui dominent l'horizon. Elles relâchent une vapeur perpétuelle qui sent l'ozone.
- *Le Diner "Chez Al" :* Le repère des ados quand ils ne sont pas à leur QG. Milkshakes à 1\$ et banquettes en skaï rouge. Al ne pose jamais de questions.
- *L'Agence du Loop :* Un complexe bureaucratique et scientifique interdit au public. Des hommes en costumes gris et des gardes en imperméables jaunes en sortent parfois.
- *La Forêt de Clatsop :* Interdite la nuit. On dit que les échos temporels y sont plus fréquents.

Les adultes préfèrent ignorer ces étrangetés. Ils appellent ça "le progrès". Les enfants, eux, savent que le monde est cassé. Et ce soir, ils vont voir jusqu'où s'étend la fissure.

#pagebreak()

// Start 2 columns for the main adventure
#columns(2, gutter: 1cm)[
  == 1. La Vie Normale

  === 1.1 Le Quotidien des Ados
  C'est un lundi de novembre. La sonnerie du *Collège d'Astoria* vient de libérer les élèves à 17h00. Il fait déjà nuit noire.
  Les PJ enfourchent leurs vélos sous une pluie battante pour rejoindre leur sanctuaire, leur "QG".
  
  *Lieu :* Le "QG". Cela peut être le garage chauffé et encombré des parents d'un PJ, une cabane construite maladroitement dans les bois derrière l'école, ou le sous-sol d'une maison rempli de vieux cartons. \
  *Ambiances :* Une odeur rassurante de poussière chauffée par les lampes, de vieux comics et de colle à maquette. Le contraste avec la tempête extérieure est saisissant.

  ==== Le Rituel Hebdo (À définir ensemble)
  Roulant en peloton, trempés mais excités, ils discutent de ce qui rassemble la bande chaque lundi :
  - *La Campagne Interminable :* Une partie de *Donjons & Dragons* qui dure depuis 2 ans. Lucas est le Maître du Donjon, et il a le manuel. Sans lui, impossible de jouer.
  - *Le Ciné-Club VHS :* Ils regardent un film d'horreur de série B loué au vidéo-club. Ce soir, c'était "L'Attaque des Tomates Tueuses". La cassette est dans le magnétoscope, en pause.
  - *Radio Pirate :* Ils tentent de capter des fréquences militaires sur leur émetteur bricolé.
  - *Le Conseil de Guerre :* Planifier la construction du "meilleur fort du monde" ou infiltrer la base du Loop.

  === 1.2 L'Anomalie
  En poussant la porte du QG, le rire s'éteint. Quelque chose cloche. Le chauffage n'est pas allumé. La pièce est glaciale et silencieuse.
  Sur la table centrale, au milieu du désordre habituel, deux éléments sautent aux yeux :
  1. *Un Post-it et une Carte* #prop(to: <annexe-1>)[Annexe 1] *:* Un message griffonné à la hâte collé sur un plan de la casse.
  2. *Le Sac à dos de Lucas :* Il est jeté en vrac sur sa chaise, ouvert.

  *Le Détail Inquiétant :*
  Lucas a fini les cours à 15h00 aujourd'hui (Mme Bennett, la prof d'anglais, était absente). Il a donc déposé ses affaires il y a plus de deux heures.
  Il a dit qu'il revenait pour 17h30 "max". Il est 17h35. Il est en retard, ce qui ne lui arrive _jamais_.

  === 1.3 La Fouille du QG
  Le message dit qu'il est "parti le chercher". Lucas est parti léger.
  Si les PJ fouillent son *sac à dos*, ils trouvent, coincés au fond sous des cahiers de cours :
  
  *Le Dossier "Projet Gravitron"* (#prop(to: <annexe-2>)[Annexe 2] & #prop(to: <annexe-3>)[Annexe 3]) *:*
  - *La Note Technique* #prop(to: <annexe-2>)[Annexe 2] *:* Un document "TOP SECRET" décrivant le fonctionnement du gant.
  - *Le Schéma* #prop(to: <annexe-3>)[Annexe 3] *:* Le plan visuel du dispositif.
  
  Lucas est parti chercher le gant et tenter de le faire fonctionner à la casse, mais il a laissé la documentation "en sécurité" ici comme indiqué sur le post-it.
]

#pagebreak()

#columns(2, gutter: 1cm)[
  === 1.4 Optionnel : Le Détour Chez Lucas
  Avant de foncer à la casse, le groupe peut décider de passer chez Lucas (à deux rues de là) pour vérifier s'il est rentré ou pour chercher d'autres indices.
  
  *La Maison Miller :* Une maison de banlieue impeccable. La télé est allumée dans le salon (le journal de 20h parle de météo catastrophique).

  ==== La Rencontre : Mme Miller
  Si les PJ sonnent, *Sarah Miller* ouvre, l'air inquiet, un torchon à la main.
  #quote(block: true)[
    "Lucas n'est pas avec vous ? Il m'a dit qu'il allait au QG pour bosser sur votre exposé."
  ]
  Elle commence à paniquer visiblement, ses mains triturant le torchon.
  #v(0.8cm)
  #align(center)[#image("assets/scenarios/echo-de-magnetron/mrs-miller.png", width: 50%)]
  #tactics[
    *LE DILEMME :* Il faut la rassurer pour ne pas qu'elle donne l'alerte.

    1. *Dire la Vérité :* "On ne sait pas où il est."
      - _Conséquence :_ Elle panique et se précipite sur le téléphone pour appeler la police. Les PJ entendent : *"Disparition inquiétante..."*. Ils n'ont plus le choix : il faut retrouver Lucas *avant* que les flics (ou pire, l'Agence) ne débarquent et bouclent la zone. La pression monte.
    2. *Mentir (CHARME) :* "Il a dû passer à la supérette acheter des chips."
      - _Réussite :_ Elle soupire de soulagement. *"Oh, d'accord. Dites-lui de rentrer vite, s'il vous plaît."*
      - _Échec :_ Elle doute. *"C'est faux. Je vais appeler vos parents."* (État *Effrayé* pour le menteur).
  ]

  ==== La Chambre de Lucas
  Si les PJ demandent à voir sa chambre ("On a oublié un livre") ou s'y faufilent (Jet de *FURTIVITÉ* pendant que l'un d'eux parle à la mère) :
  C'est un sanctuaire de la pop-culture : posters *E.T.*, maquettes de X-Wing, et un Commodore 64 en veille.

  *L'Indice Bonus : La Cassette*
  Dans son vieux magnétophone, une cassette est enclenchée. Bouton *PLAY*.
  La voix de Lucas grésille, tremblante, couvrant le bruit de la pluie :
  #quote(block: true)[
    "J'ai trouvé un truc dingue à la casse. Ça ressemble à la main d'un robot géant. Mais... c'est trop propre. Comme si ça venait de sortir de l'usine. Je vais le voir de plus près."
  ]
]

#pagebreak()

#columns(2, gutter: 1cm)[
  == 2. Le Voyage
  Il n'y a pas le choix. Il faut sortir affronter la tempête. Les PJ enfourchent leurs vélos et s'enfoncent dans la nuit de la forêt.

  #note[
    *CONSEIL AU MJ : L'ATMOSPHÈRE* \
    Cette section est cruciale pour établir l'ambiance. Décrivez les sensations physiques : le froid qui engourdit les doigts sur les freins, la pluie qui s'infiltre dans le col, les flaques d'eau noire qui éclaboussent. Utilisez des sons : le croassement des corbeaux, le sifflement du vent, le craquement des branches. Le Loop doit être ressenti avant d'être vu.
  ]

  === 2.1 Le Trajet et l'Embuscade
  Le trajet est un calvaire. Vent latéral, pluie glacée, ombres déformées par les lampadaires au sodium... la nuit est hostile.

  *Événements Optionnels (au choix) :*
  - *Le Camion Fantôme :* Un semi-remorque sans phares surgit. Jet de *AGILITÉ* pour l'éviter.
  - *La Panne :* Crevaison. Jet de *BRICOLAGE* pour réparer ou continuer à pied.
  - *L'Ombre :* Une silhouette massive dans les sapins. Élan ou robot ? Personne ne veut savoir.
  
  === 2.2 Les Agents du Loop
  Au détour d'un virage, des phares aveuglants. Une camionnette blanche du Loop bloque la route, antenne pivotant sur le toit. La radio crache des codes ("Secteur 4... Code Noir"). Deux agents sortent dans le contre-jour :
  ==== Agent Kowalski (La Recrue)
    Jeune, nerveux, il tient sa lampe torche comme une arme. Il sursaute au moindre bruit. Il veut prouver sa valeur.
    #v(0.1cm)
    #align(center)[#image("assets/scenarios/echo-de-magnetron/agent-kowalski.png", width: 45%)]
  ==== Agent Chen (Le Vétéran) 
    La cinquantaine, visage buriné par la pluie. Il fume une cigarette en s'abritant sous le hayon. Il a l'air lassé. Il ne croit pas aux monstres, juste aux gamins qui font des bêtises.
    #v(0.1cm)
    #align(center)[#image("assets/scenarios/echo-de-magnetron/agent-chen.png", width: 45%)]

]

#pagebreak()

#block(width: 100%, inset: (top: 10pt))[

  #quote(block: true)[
    *Kowalski (au mégaphone) :* \  "Hé là-bas ! Couvre-feu ! Cette zone est interdite aux civils. Anomalie magnétique de classe 4 détectée. Faites demi-tour immédiatement ou je..." \
    *Chen (voix grave) : * \ "Range ça, gamin. Hé les enfants ! Rentrez chez vous. Il fait un temps de chien et y'a rien à voir ici à part de la boue."
  ]

  #tactics[
    C'est un test pour le groupe. Comment vont-ils passer ?

    1. *L'Approche Furtive (FURTIVITÉ) :* Jeter les vélos dans les fourrés et ramper dans le fossé boueux.
      - _Réussite / Réussite Critique :_ Ils passent inaperçus derrière la camionnette.
      - _Échec :_ Un Agent braque sa torche sur eux. Course-poursuite (État *Épuisé*).
      - _Échec Critique :_ Ils sont cernés. Les agents confisquent un objet clé (Talkie, sac...).
    2. *L'Approche Sociale (CHARME) :* _"On a perdu notre chien, monsieur !"_
      - _Réussite / Réussite Critique :_ Les gardes s'adoucissent. _"Allez, filez vite."_
      - _Échec :_ Ils notent leurs noms et appellent les parents (État *Contrarié* ou *Effrayé*).
    3. *La Force Brute (FORCE ou AGILITÉ) :* Pédaler comme des dératés, couper à travers champs.
      - _Réussite :_ Ils sement la camionnette mais arrivent *Épuisés*.
      - _Réussite Critique :_ Ils trouvent un raccourci parfait (Pas d'État).
      - _Échec :_ Chute dans la boue ou branche dans le visage (État *Blessé*).
      - _Échec Critique :_ Un vélo est tordu et inutilisable (État *Blessé*) + Il faudra continuer à pied.
  ]

  === 2.2 Arrivée sur Zone
  Les PJ arrivent aux abords de la casse. C'est un cimetière de métal s'étendant sur des hectares. Des carcasses de vieilles Chevrolet, de Ford et de tracteurs magnétiques s'empilent comme des squelettes de dinosaures mécaniques.
  *Ambiance :* Tout grince. Le vent fait claquer les tôles. Une odeur forte d'ozone et d'électricité statique flotte dans l'air, couvrant l'odeur de rouille mouillée.

  Devant ce labyrinthe de ferraille, le groupe s’abrite un instant pour consulter le plan de Lucas (#prop(to: <annexe-1>)[Annexe 1]). La lueur bleue pulse au loin, au cœur du site.
  Il y a deux accès possibles indiqués sur le papier. C'est le moment de décider comment entrer.
]

#pagebreak()

#columns(2, gutter: 1cm)[
  == 3. La Casse de Joe
  Selon le plan trouvé dans le sac de Lucas (#prop(to: <annexe-1>)[Annexe 1]), il y a deux façons d'entrer dans l'enceinte pour rejoindre la zone du Bus Scolaire où pulse une inquiétante lumière bleue.

  === 3.1 Le Choix de l'Approche
  Laissez les joueurs observer le plan et choisir leur stratégie.

  === 3.2 Option A : L'Entrée Principale (La Voie Directe)
  *Le Portail :* Une grille rouillée surmontée de barbelés. La cabane de Vieux Joe est juste à côté, avec de la lumière aux fenêtres et de la fumée qui sort de la cheminée.
  - *Obstacle :* Vieux Joe et son chien "Boulon".
  - *Action :*
    - _Sociale :_ Frapper à la porte. Joe est bourru mais il connaît les gamins. Il peut les laisser passer s'ils sont convaincants (Jet de *CHARME*). _"Allez, filez, et ne touchez à rien."_
    - _Force :_ Escalader le portail (Jet de *AGILITÉ*) au risque de déchirer ses vêtements ou de faire du bruit.
  - *Risque :* Si ça tourne mal, Joe sort avec son fusil (chargé au gros sel) pour effrayer les intrus.

  === 3.3 Option B : L'Entrée Secrète (La Voie Furtive)
  *Le Passage du Tunnel :* Indiqué par une croix sur le plan. C'est une buse d'évacuation des eaux pluviales à demi-enfouie sous des carcasses de voitures, à l'arrière du terrain.
  - *Obstacle :* L'étroitesse et la saleté.
  - *Action :*
    - _Technique :_ Il faut forcer la grille de la buse (Jet de *FORCE* ou *BRICOLAGE* avec un pied de biche).
    - _Agilité :_ Ramper dans le conduit boueux sans paniquer (Jet de *AGILITÉ*).
  - *Risque :* Finir avec l'État *Sale* ou *Effrayé* (rats, araignées). Mais c'est une arrivée très discrète, directement près du bus.

  === 3.4 Au Cœur du Labyrinthe
  Quel que soit le chemin, ils doivent traverser l'Allée des Épaves.
  Au centre de ce labyrinthe, la lumière bleue surnaturelle pulse. Elle éclaire les carcasses d'une lueur fantomatique. Elle vient de la zone du vieux bus scolaire jaune.

  #note[
    *RÈGLE : EXPLORATION DE LA CASSE* \
    Si les joueurs veulent explorer la casse avant d'aller au bus, proposez des jets de *COMPRÉHENSION* pour découvrir des indices (pièces de robots, outils oubliés par l'Agence) ou des jets de *FURTIVITÉ* pour éviter les pièges naturels (tôles coupantes, piles instables). Chaque "détour" ajoute de la tension mais consomme du temps précieux.
  ]
]

#pagebreak()

#block(width: 100%, inset: (top: 10pt))[
  == 4. Le Robot M-77
  === 4.1 La Scène
  En approchant, le spectacle est terrifiant.
  À une dizaine de mètres du bus, le #keyword[talkie-walkie] de Lucas gît au sol dans la boue. Il a dû le perdre lorsque le gant s'est activé, l'attirant violemment contre la carrosserie.
  Plus le groupe avance, plus l'air semble lourd, électrique. La pluie ne tombe plus tout à fait droit ; les gouttes semblent *ralentir* imperceptiblement à l'approche du bus, comme si elles traversaient de l'huile invisible. Les sons deviennent graves et ouatés. Ils entrent dans l'anomalie.
  #keyword[Lucas] est là. Il est plaqué dos contre la carrosserie rouillée du bus, les pieds ne touchant plus terre. Il porte à la main droite un objet massif : un énorme #keyword[gant industriel] bardé de câbles, de tubes cathodiques et d'ampoules. Le gant semble _soudé_ magnétiquement au métal du bus.
  Lucas pleure, épuisé.
  #quote[
    *Lucas :* "N'approchez pas ! Je ne peux pas l'enlever ! C'est comme si... c'est comme s'il faisait partie de moi ! Il aspire tout !"
  ]

  Face à lui, flottant silencieusement à un mètre du sol, se trouve l'horreur : une *Unité de Maintenance M-77*.
  #v(0.5cm)
  #align(center)[
    #image("assets/scenarios/echo-de-magnetron/m-77-bw.png", width: 60%)
  ]
  #v(0.5cm)
  C'est une masse flottante beige et orange, usée par le temps et les intempéries. Son châssis cylindrique est bardé de câbles pendants et de plaques de blindage abîmées. Elle déploie deux bras manipulateurs massifs terminés par des pinces hydrauliques. Son "œil" central, une #keyword[optique rouge] rectangulaire, balaie la zone dans un bourdonnement sourd.

  Le robot ne parle pas. Il émet des cliquetis et des bruits de modem.
  
  #note[
    *POURQUOI LE ROBOT N'A PAS ENCORE TIRÉ ?* \
    Le M-77 ne doute pas, il vise. Il est bloqué par une "BOUCLE DE RECALIBRAGE" car il détecte deux signatures pour le même objet (le gant et son écho). Il cherche l'angle de tir parfait pour extraire le gant sans l'endommager. \
    *Menace :* Décrivez ses armes qui suivent chaque mouvement des PJs. Ils doivent sentir qu'ils sont des cibles verrouillées. Dès que sa boucle logique est résolue (ou si on le provoque), il passe en "PROTOCOLE DE PURGE". La neutralisation n'est pas une option, c'est une survie.
  ]

  #note[
    *L'ANOMALIE TEMPORELLE* \
    Lucas est là depuis plus de deux heures, mais pour lui, à peine quelques minutes se sont écoulées. La proximité du gant dilate le temps. C'est ce qui l'a "protégé" (il n'est pas mort d'hypothermie ou de choc) mais c'est aussi un piège : plus on reste près du gant, plus le monde extérieur s'accélère et s'éloigne.
  ]

  #note[
    ==== M-77 "WATCHER"
    *Type :* Robot de maintenance (Bug: Mode Agressif / Protocole de Récupération) \
    *Stats :* Physique 3, Tech 2, Se mouvoir 2 \
    *Capacités :*
    - *Rayon Tracteur (Force 2) :* Attire les objets métalliques ou les enfants vers lui.
    - *Bras Pinces :* Peut saisir, couper ou broyer. Inflige un État (*Blessé*).
    - *Choc Électrique :* Une décharge de défense si on le touche (État *Épuisé*).
  ]
]

#pagebreak()

#block(width: 100%, inset: (top: 10pt))[
  === 4.2 Mécanique : Échos du Futur
  Le gant "#keyword[Gravitron]" n'est pas juste un aimant. C'est une *faille dans l'espace-temps*. La réalité autour de lui est fine comme du papier à cigarette. \
  *Règle Spéciale :* Chaque fois qu'un PJ touche le gant, rate un jet de *BRICOLAGE* à proximité, ou tente d'interagir avec le paradoxe, lancez *1d6* sur la table des #keyword[Échos]. Décrivez la vision à voix haute, seul le PJ concerné la voit.

  #block(
    stroke: 3pt + tfl-orange,
    radius: 4pt,
    clip: true,
    width: 100%,
    table(
      columns: (40pt, 1fr),
      inset: (x: 10pt, y: 12pt),
      align: (col, row) => if col == 0 { center + horizon } else { left + horizon },
      fill: (col, row) => if row == 0 { tfl-orange } else if calc.odd(row) { rgb("#fff8ef") } else { white },
      stroke: (x, y) => if y == 0 { none } else { (top: 1pt + rgb("#eeeeee"), bottom: none, x: none) },
      
      text(fill: white, weight: "bold")[d6], 
      text(fill: white, weight: "bold")[Vision (Flash de 5 secondes)],
      
      [*1*], [*La Ruine :* Ciel gris cendre. Le bus rouillé, englouti par une végétation mutante. Les tours du Loop effondrées. Une odeur âcre de soufre prend à la gorge. Silence terrifiant.],
      [*2*], [*Le Mutilé :* Un homme de 40 ans, visage émacié. Il porte le blouson du PJ, déchiré. Sa manche droite est vide. Il le regarde avec ses yeux et murmure en pleurant : "Pardon... je ne savais pas."],
      [*3*], [*L'Incendie :* Le monde s'embrase. École, forêt, tout brûle. La chaleur cloque la peau. Sirènes d'alerte, cris désespérés des parents à travers la fumée noire.],
      [*4*], [*L'Avertissement :* Le son se coupe. Une voix résonne *dans* le crâne du PJ, faisant vibrer ses os. C'est sa voix, vieillie, cassée par le deuil : _"Lâche ça ! Si tu le touches, tu vas tous nous tuer. Cours, bon sang, COURS !"_],
      [*5*], [*La Douleur :* Le gant devient incandescent. La main fusionne avec le métal, la peau bouillonnant. Une douleur de feu remonte au cœur. Le PJ hurle. (État *Blessé* mental).],
      [*6*], [*Le Glitch :* La réalité saute comme un disque rayé. La pluie se fige, puis rembobine. Le PJ voit la prochaine attaque du robot en accéléré. Il anticipe sa trajectoire. Il peut *relancer immédiatement* son dernier jet de dés.]
    )
  )
]

#pagebreak()

// Section 4 seems to be 2 cols mostly
#block(width: 100%, inset: (top: 10pt))[
  == 5. Le Reveal : Le Paradoxe
  Les PJ arrivent sur la scène décrite dans la section 4 : Lucas est coincé, le robot M-77 le menace. Avant de pouvoir sauver leur ami, ils doivent *neutraliser temporairement le robot*.

  === 5.1 Distraire le Robot
  Le M-77 est programmé pour récupérer le gant. Tant qu'il perçoit les PJ comme une menace, il les attaquera. Il faut le *confondre* pour qu'il perde leur trace.

  #tactics[
    *OBJECTIF :* Accumuler *2 réussites* pour distraire le robot.

    1. *Lancer des débris (AGILITÉ) :* Bombarder le robot avec des pièces de métal.
       - _Réussite :_ +1 réussite.
       - _Échec :_ Le PJ glisse dans la boue ou force trop. État *Épuisé*.
       - _Échec Critique :_ Le robot riposte en projetant un débris violent. État *Blessé*.
    2. *Brouiller les capteurs (BRICOLAGE) :* Talkie-walkie pour créer des interférences.
       - _Réussite :_ +1 réussite.
       - _Échec :_ Feedback sonore strident qui tétanise le PJ. État *Effrayé*.
       - _Échec Critique :_ Le talkie-walkie grille définitivement (objet perdu).
    3. *Diversion sonore (FURTIVITÉ) :* Klaxon, tôle qui tombe.
       - _Réussite :_ +1 réussite.
       - _Échec :_ Le robot repère la position exacte et se tourne vers le PJ.
       - _Échec Critique :_ Le robot saisit le PJ instantanément avec son rayon tracteur.
    4. *Appeler le robot (EMPATHIE) :* Parler au robot (Difficulté +1).
       - _Réussite :_ +1 réussite. _Réussite Critique :_ +2 réussites (Distraction totale).
       - _Échec :_ Il ignore le PJ.
       - _Échec Critique :_ Il identifie le PJ comme une menace prioritaire et charge.
  ]

  Une fois les 2 réussites obtenues, le robot est confus *30 secondes*. Les PJ rejoignent Lucas.

  #note[
    *LE PARADOXE TEMPOREL : PHILOSOPHIE* \
    Cette scène est le cœur du scénario. Le paradoxe n'est pas "résolu" — il est accepté. Lucas du futur a choisi de sacrifier son existence pour sauver ses amis. Cette mécanique narrative doit être traitée avec émotion, pas comme un casse-tête logique. Si les joueurs posent des questions sur les implications temporelles, répondez : _"Vous ne comprenez pas tout, mais vous ressentez que c'est vrai."_
  ]
]

#pagebreak()

#columns(2, gutter: 1cm)[
  === 5.2 Le Compartiment Secret
  Lucas hurle que le gant chauffe, que sa peau brûle. Il faut trouver une source d'énergie pour l'éteindre. Un PJ (l'Intello ou le Bricoleur) inspecte le gant et force un petit capot de maintenance sous le poignet.
  - *La Surprise :* Il n'y a pas de batterie à l'intérieur. Le logement est vide... à l'exception d'un petit papier plié en quatre.
  - *L'Anomalie :* Le gant est flambant neuf, brillant de chrome. Mais le contenu du compartiment est jauni, fragile, taché d'huile séchée, et sent le vieux livre. Il a au moins 20 ans. Il y a *deux* documents : une lettre et un schéma technique annoté.

  === 5.3 Le Temps Suspendu
  Au moment où un PJ déplie le papier pour le lire :
  - *Le Silence :* Le bruit de la pluie, du vent et du robot se coupe net.
  - *L'Arrêt sur Image :* Les gouttes de pluie se figent en l'air, formant un rideau de perles liquides autour du groupe. Lucas est figé, la bouche ouverte dans un cri silencieux. Le robot est immobile, ses pinces tendues.
  - *L'Œil du Cyclone :* Seuls les PJ à proximité immédiate du gant peuvent encore bouger, respirer et parler. Ils sont hors du temps.

  === 5.4 La Lettre et le Schéma (Props en Annexe)
  _Donnez physiquement l'#prop(to: <annexe-4>)[Annexe 4] (Lettre) et l'#prop(to: <annexe-5>)[Annexe 5] (Schéma du Futur) aux joueurs._ \
  Lisez la lettre ensemble. Elle est tapée à la machine — une vieille machine à écrire, avec ses frappes inégales et son encre légèrement bavée. C'est un message d'outre-temps, écrit par un Lucas plus vieux de 20 ans. Elle explique que si le gant explose ce soir (ce qui s'est passé dans sa timeline), la ville sera détruite et leurs vies brisées. Il donne la solution technique pour éviter ça, griffonnée sur le vieux schéma.

  #note[
    *MISE EN SCÈNE : LA LETTRE* \
    Pour maximiser l'impact émotionnel, imprimez l'#prop(to: <annexe-4>)[Annexe 4] sur du papier vieilli (à l'aide de thé ou café). \
    Froissez-la légèrement. Quand vous la tendez aux joueurs, baissez la voix et dites : \
    _"Le papier est chaud. Il vibre légèrement entre vos doigts."_
  ]
]

#pagebreak()

// Section 5
#block(width: 100%, inset: (top: 10pt))[
  == 6. Le Climax : Court-Circuit
  Dès la lecture finie, le temps reprend brutalement son cours avec un *BANG* sonore. Le robot M-77 a décidé que l'extraction du bras de Lucas était la seule option. Il charge.

  *Objectif :* Connecter le *fil bleu* caché dans le gant à la carcasse du robot pour créer une "Masse à la Terre" et décharger l'énergie du paradoxe.

  === 6.1 Une Action collective
  C'est le moment de tout donner. Pour réussir à connecter le fil malgré le chaos, le groupe doit cumuler *3 RÉUSSITES MAJEURES* avant que le Robot ne broie Lucas.
  Il n'y a qu'un seul but (le fil bleu), mais chacun peut aider à sa manière :

  #tactics[
    1. *Celui qui Connecte :*
       - *Action :* Ouvrir le panneau, dénuder le fil bleu et le plaquer contre le métal du robot.
       - *Jet :* *COMPRÉHENSION* ou *BRICOLAGE*.
       - *Enjeu :* C'est l'action décisive. Sans elle, rien ne se passe.
    2. *Celui qui Immobilise :*
       - *Action :* Utiliser la Grue Magnétique ou une barre à mine pour bloquer les pinces du robot.
       - *Jet :* *FORCE* ou *AGILITÉ*.
       - *Bonus :* Chaque réussite donne +2 dés au Technicien.
    3. *Celui qui fait Diversion :*
       - *Action :* Se jeter devant le robot, hurler, ou lui jeter des cailloux pour attirer son attention.
       - *Jet :* *AGILITÉ* ou *EMPATHIE*.
       - *Risque :* Le PJ prend l'Attaque à la place de Lucas (État *Blessé* automatique en cas d'échec), mais sauve le Technicien d'une interruption.
  ]
]

#block(width: 100%, inset: (top: 10pt, bottom: 20pt))[
  === 6.2 Le Final
  Au moment où le fil bleu est branché sur le robot :
  L'énergie accumulée se libère. Un *FLASH BLANC* aveuglant engloutit la casse. Une onde de choc renverse le groupe dans la boue. Le son de l'électricité qui grille est assourdissant.
  Puis... plus rien. Juste le bruit de la pluie.
  En ouvrant les yeux, le gant est tombé en poussière de rouille rouge. Le robot M-77 gît au sol, inerte, fumant, son œil rouge définitivement éteint. Lucas est sain et sauf, massant son bras engourdi.
]

#pagebreak()

#block(width: 100%, inset: (top: 10pt, bottom: 20pt))[
  == Épilogue : L'Après
  La pluie reprend, calme et régulière cette fois, lavant la peur.
  Au loin, des sirènes et des crissements de pneus. Les vans noirs du Loop approchent, attirés par le pic d'énergie. Il faut fuir.

  === Les Conséquences de la Nuit
  L'ambiance de la fin dépend de l'état général du groupe. Comptez le total des *États cochés* par tous les PJs et comparez ce chiffre au *Nombre de Joueurs (N)*.

  - *Total < N (Triomphe) :* _La Fin Parfaite._ (Moins d'un État par joueur) \
    Les PJ disparaissent dans la nuit comme des fantômes. Le lendemain, à l'école, personne ne sait. Lucas a toujours ses deux bras. En rentrant chez lui, l'un des PJ trouve par hasard un dossier confidentiel oublié sur le bureau de son père (employé du Loop) : les *2 Rapports de Sécurité* (#prop(to: <annexe-6>)[Annexe 6]). Ils comprennent toute l'histoire. Ils sont les gardiens secrets de la ville.

  - *Total < 2 x N (Réalisme) :* _La Fin Juste._ (Entre 1 et 2 États par joueur) \
    Les PJ rentrent chez eux, couverts de boue, égratignés. Les parents hurlent et punissent. Mais en sortant du bureau après la dispute, un PJ aperçoit un papier frappé du tampon "CONFIDENTIEL" : le *Rapport d'Incident Courant* (#prop(to: <annexe-6>)[Annexe 6]). Ils savent que l'Agence est au courant, mais qu'elle a décidé d'étouffer l'affaire. Le groupe est uni par ce secret.

  - *Total ≥ 2 x N ou un PJ Brisé (Drame) :* _La Fin Dure._ (Plus de 2 États par joueur) \
    La police cueille le groupe à la sortie de la casse. Interrogatoire. Parents convoqués au poste. C'est l'humiliation. Lucas, traumatisé, est envoyé en "camp de repos" par ses parents. Ils ne le reverront qu'à la rentrée suivante. Il aura changé, mûri trop vite. L'innocence de l'enfance est perdue ce soir-là.
]

// Annexes - Single Page Full Width
#pagebreak()

= SECRETS DU MAITRE DU JEU

#secret[
  *CHRONOLOGIE DU PARADOXE* \
  Voici la vérité complète que les joueurs découvriront par fragments.
  
  *0. L'ENQUÊTE (Le Week-end préliminaire)* \
  Lucas a découvert la cachette d'un voleur du Loop dans la Casse. Il a récupéré les plans mais n'a pas osé toucher au gant. Lundi matin, persuadé d'avoir trouvé un trésor, il a laissé un mot ("J'ai trouvé l'endroit exact !", #prop(to: <annexe-1>)[Annexe 1]) pour dire qu'il partait le récupérer à la Casse avant l'orage.
  
  *1. L'IMPACT (12 Nov 1984 - Timeline A)* \
  Ce soir là, les PJ n'étaient pas là. Lucas a activé le gant sans le mettre à la terre. Le robot M-77 l'a agrippé.
  _Conséquence :_ Surcharge cataclysmique du Gravitron. Une sphère de 10km autour d'Astoria a été rasée instantanément. 
  
  *2. LES CENDRES (2004 - Futur Perdu)* \
  Lucas a survécu, protégé par le champ de force du gant, mais il a perdu son bras et ses amis. Il a grandi dans la culpabilité, au milieu des ruines. Devenu physicien, il a passé 20 ans à recalibrer le gant pour en faire une balise temporelle.
  
  *3. LE TRANSFERT (Point de Rupture)* \
  Lucas (2004) ne peut pas voyager physiquement. Il a seulement pu envoyer un objet inerte de petite masse : la *Lettre* (#prop(to: <annexe-4>)[Annexe 4]) ainsi que le *Schéma Annoté* (#prop(to: <annexe-5>)[Annexe 5]). Il les a téléportés *dans* le compartiment du gant, quelques secondes avant l'explosion de 1984.
  
  *4. LA DIVERGENCE (12 Nov 1984 - Timeline B)* \
  C'est *maintenant*. La Lettre est arrivée. Sa masse et sa signature temporelle ont créé une micro-interférence qui a gelé le robot M-77 (voir Note Scène 3).
  *Votre partie se joue dans cet interstice de quelques minutes offert par le Lucas du futur.*
]

#pagebreak()


// Annexes - Single Page Full Width
// Annexes - Single Page Full Width
== Annexe 1 : Post-it et Plan de Lucas <annexe-1>
#v(1fr)
#align(center)[
  #sticky-note(rotation: -2deg)[
    Je suis sur que je peux le faire marcher ! Je file le chercher à la Casse avant l'orage.

    J'ai laissé les plans dans mon sac pour qu'ils soient au sec.

    Les gars, c'est énorme ! Je reviens pour 17h30 max !
  ]
]
#v(1cm)
#align(center)[
  #shadow-block(rotation: 1.5deg)[
    #image("assets/scenarios/echo-de-magnetron/plan_casse.png", width: 100%)
  ]
]
#v(1fr)

#pagebreak()

== Annexe 2 : Note « Projet Gravitron » <annexe-2>
#v(1fr)
#shadow-block(rotation: -0.5deg)[
  #blueprint[
    *CLASSIFICATION :* TOP SECRET \
    *OBJET :* Module de Manipulation Gravitationnelle Portatif (MMGP) \
    *DATE D'IMPRESSION :* 26/10/1980 \
    
    *DESCRIPTION DU SYSTÈME :* \
    Le MMGP (projet "Gravitron") est un amplificateur de champ localisé. Il est conçu pour permettre à un opérateur humain de manipuler des masses allant jusqu'à 500kg sans assistance hydraulique externe. L'unité convertit les ondes cérébrales alpha via l'interface neurale du poignet pour moduler la gravité autour de la main gantée.
    
    *SPÉCIFICATIONS TECHNIQUES :* \
    - *Source d'Alimentation :* Micro-cellule à fusion froide Mark-IV (Durée de vie théorique : 200 ans).
    - *Bobines :* Tri-phase Tesla inversée avec noyau en cobalt enrichi.
    - *Refroidissement :* Azote liquide en circuit fermé.
    
    *PROTOCOLE DE SÉCURITÉ #88-B :* \
    En raison le l'instabilité du noyau en cobalt, il est impératif de vérifier la continuité de la masse avant chaque activation.
    - Le voyant *ROUGE* indique une accumulation de charge statique dangereuse.
    - Le voyant *VERT* indique que le système est stable.
    
    *ATTENTION DANGER DE MORT :* \
    Si l'appareil surchauffe, ne JAMAIS tenter de le retirer de force. L'interface neurale se verrouille pour protéger le système nerveux de l'utilisateur.
    La stabilité du champ est critique. Le *PÔLE POSITIF (Fil Rouge)* est instable par design pour permettre la fluctuation de gravité. Toute surcharge statique doit être évacuée par une mise à la terre immédiate via le *CÂBLE BLEU (Négatif)* situé sous le panneau de maintenance.
  ]
]
#v(1fr)

#pagebreak()

== Annexe 3 : Schéma Projet Gravitron (Présent) <annexe-3>
#v(1cm)
#shadow-block(rotation: 0.5deg)[
  #image("assets/scenarios/echo-de-magnetron/schema_gravitron_present.png", width: 100%)
]
#v(1fr)

#pagebreak()

== Annexe 4 : La Lettre du Futur <annexe-4>
#v(2cm)
#shadow-block(rotation: 0.5deg)[
  #letter[
    *DATE :* 12 Novembre 2004 \
    *LIEU :* Ruines du Secteur Est, Zone Interdite du Loop.

    À la bande du QG, \
    À moi-même,

    Si vous lisez ceci, le transfert a fonctionné. J'écris depuis un futur qui cessera d'exister si vous réussissez. Je ne vous reverrai jamais — mais c'est le but.

    J'ai réussi à transférer ce message dans le compartiment vide du gant. C'est ma seule chance.

    *NE LAISSEZ PAS L'AGENCE RÉCUPÉRER CE GANT.* \
    Ce soir, le gant a surchauffé. L'explosion a rasé Astoria sur 10 kilomètres. Il n'y a pas eu d'évacuation, juste des cendres. Je suis le seul survivant du "Cratère". J'ai passé ma vie dans les ruines à chercher un moyen de revenir à cette nuit-là.

    La solution est sous vos yeux, simple et stupide : Le Gravitron n'a pas de masse à la terre. Le robot M-77 est plein d'énergie statique.
    1. *N'ENLEVEZ PAS LE GANT* (ça vous tuerait).
    2. Trouvez le *FIL BLEU*.
    3. Déconnectez le *FIL BLEU* au niveau du pouce.
    4. *BRANCHEZ CE FIL À LA CARCASSE DU ROBOT (le port sous son oeil).*

    Utilisez sa recharge pour griller le circuit. Ça va faire mal, mais ça nous sauvera tous.

    Signé : _Lucas (Celui qui a survécu)_
  ]
]

#pagebreak()

== Annexe 5 : Schéma Projet Gravitron (Futur) <annexe-5>
#v(1cm)
#shadow-block(rotation: 2deg)[
  #image("assets/scenarios/echo-de-magnetron/schema_gravitron_futur.png", width: 100%)
]
#v(1fr)

#pagebreak()

== Annexe 6 : Rapports de Sécurité (Archive & Courant) <annexe-6>
#v(1cm)
#shadow-block(rotation: 1deg)[
  #report[
    *AGENCE DU LOOP - BUREAU DE SÉCURITÉ INTERNE* \
    *RAPPORT DE VOL \#34-Z* \
    *DATE :* 04/06/1982 \
    
    *SUJET :* Disparition de Prototype (MMGP / Gravitron) \
    
    *INCIDENT :* \
    Lors de l’inventaire du Stockage 4, l'absence du prototype "Gravitron" a été constatée. Aucune effraction n'a été détectée, suggérant une complicité interne. \
    
    *PISTAGE :* \
    Le signal de la balise passive a été perdu à la limite du périmètre Nord, près de la décharge civile (Zone "Scrapyard"). Les recherches sur place n'ont rien donné en raison des interférences magnétiques dues aux carcasses métalliques. \
    
    *STATUT :* CLASSÉ SANS SUITE - MATÉRIEL CONSIDÉRÉ PERDU.
  ]
]
#v(1cm)
#shadow-block(rotation: -1deg)[
  #report[
    *AGENCE DU LOOP - BUREAU DE SÉCURITÉ INTERNE* \
    *RAPPORT D'INCIDENT \#99-AX* \
    *DATE :* 12/11/1984 - 17h42 \

    *SUJET :* Réactivation de l'Unité M-77 et Anomalie \

    *DESCRIPTION :* \
    À 17h42, nos capteurs ont détecté une fluctuation de classe 4 dans le secteur de la décharge (Zone B). L'unité de maintenance M-77, envoyée pour patrouille, a cessé d'émettre. \

    Les données indiquent qu'elle a retrouvé la trace de l'artefact volé en 1982 (Projet G.). L'unité est passée en mode agressif pour "Recouvrement de Propriété". \

    *CONCLUSION :* \
    Intervention immédiate requise. Confinement de la zone. \

    *STATUT :* EN COURS D'INVESTIGATION.
  ]
]

#pagebreak()

== Annexe 7 : Carte de la Zone d'Astoria (Le Loop) <annexe-7>

#align(center + horizon)[
  #rotate(90deg, reflow: true)[
    #image("assets/scenarios/echo-de-magnetron/astoria-map.png", width: 94%)
  ]
]
