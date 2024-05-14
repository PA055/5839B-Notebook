#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial: radial-theme, components

#show: notebook.with(theme: radial-theme, cover: align(center + horizon)[
  #text(size: 24pt, font: "Tele-Marines")[
    #text(size: 28pt)[
      Engineering Notebook
    ]

    #image("./assets/logo.jpg", height: 70%)

    2024 - 2025
    #line(length: 50%, stroke: (thickness: 2.5pt, cap: "round"))
    High Stakes
  ]
])


#include "/frontmatter.typ"

#include "./Entries/entries.typ"

#include "./appendix.typ"