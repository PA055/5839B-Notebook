#import "./colors.typ": *
#import "./icons/icons.typ"
#import "./components/title.typ" as components
#import "/utils.typ"
#import "./metadata.typ": entry-type-metadata

// TODO: make an actual cover
#let cover(context: (:)) = [
  #set align(center + horizon)
  #set text(size: 24pt)
  *5839B Engineering Design Notebook*
]

#let frontmatter-entry(context: (:), body) = {
  show: page.with(
    header: components.title(context.title),
    footer: align(right, counter(page).display("i")),
  )
  body
}

#let body-entry(context: (:), body) = {
  let metadata = entry-type-metadata.at(context.type)
  show: page.with(header: components.title(
    beginning: image.decode(
      utils.change-icon-color(raw-icon: metadata.icon, fill: white),
      height: 1em,
    ),
    end: context.date.display("[year]/[month]/[day]"),
    color: metadata.color,
    context.title,
  ), footer: [
    #line(length: 100%)
    #align(left, [
      *Designed by:* #context.author #h(2pt) \
      *Witnessed by:* #context.witness
      #h(1fr) #counter(page).display()
    ])
  ])
  body
}

#let appendix-entry(context: (:), body) = {
  show: page.with(
    header: components.title(context.title),
    footer: align(right, counter(page).display()),
  )

  body
}
