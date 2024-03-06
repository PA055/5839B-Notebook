#import "/lib.typ": *
#import themes.radial: radial-theme, components, colors
#import colors: *

#show: notebook.with(theme: radial-theme, team-name: "5839B", season: "Water Game", year: "2024-2025")


#create-frontmatter-entry(
  title: "Table of Contents",
  type: "decide",
  date: datetime(year: 2024, month: 1, day: 1),
)[
  #components.toc()
]

#create-body-entry(
  title: "First Steps",
  type: "decide",
  date: datetime(year: 2024, month: 3, day: 5),
)[
  
]
