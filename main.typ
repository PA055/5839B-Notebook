#import "notebookinator/lib.typ": *
#import themes.radial: radial-theme, components, colors
#import components: *
#import colors: *

#show: notebook.with(theme: radial-theme, cover: align(center + horizon)[
  #text(size: 24pt, font: "Tele-Marines")[
    #text(size: 28pt)[
      Engineering Notebook
    ]

    // #image("./assets/53E-logo-jank.png", height: 70%) // Copyed and pasted, fix this logo

    2024 - 2025
    #line(length: 50%, stroke: (thickness: 2.5pt, cap: "round"))
    High Stakes

  ]
])
#include "/frontmatter.typ"

#include "entries/entries.typ"

#include "./appendix.typ"