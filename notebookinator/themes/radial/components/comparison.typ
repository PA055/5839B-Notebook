#include "../colors.typ"

/// A table displaying pros and cons.
///
/// - pros (content): The positive aspects
/// - cons (content): The negative aspects
/// -> content
#let comparison(categories: (), ..contents) = [
  #let cell = rect.with(width: 100%, inset: 5pt)
  #grid(
    columns: calc.max(categories.len(), 1),
    column-gutter: 4pt,

    ..for category in categories {
      cell(fill: gray, radius: (top: 1.5pt))[*#category*]
    },

    ..for i in range(calc.max(categories.len(), 1)) {
      let color = if (calc.rem(i, 2) == 0) {gray.lighten(80%)} else {gray.lighten(60%)}
      if i == calc.max(categories.len(), 1) - 1 {
        cell(fill: color, radius: (bottom: 1.5pt))[
          #contents.pos().at(i)
        ]
      } else {
        cell(fill: color)[
          #contents[i]
        ]
      }
    },
  )
]
