#import "/lib.typ": *
#import themes.radial: radial-theme, components, colors
#import colors: *

#show: notebook.with(theme: radial-theme, team-name: "5839B", season: "Water Game", year: "2024-2025")


#create-frontmatter-entry(
  title: "Table of deez nuts",
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
  With the end of the Over Under season, sadly we didn't make it to worlds, we evalutated out progress and decided that we need a better programming library. My job as the coder is to record and create a programming library that serves all our needs for the improved robot.
  In the Over Under season we didn't get all of the systems we wanted running working in time for the competition, for the autonomous we used PROS with both the okapi library and the lemlib library
  #components.comparison(categories: ("Okapilib", "Lemlib"))
]