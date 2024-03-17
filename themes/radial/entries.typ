#import "./colors.typ": *
#import "./icons/icons.typ"
#import "./components/title.typ" as components
#import "/utils.typ"
#import "./metadata.typ": entry-type-metadata

// TODO: make an actual cover
#let cover(ctx: (:)) = [
  #set align(center + horizon)
  #set text(size: 24pt)
  *#if ctx.title == none {ctx.team-name + "'s Notebook"} else {ctx.title}*
]

#let frontmatter-entry(ctx: (:), body) = {
  show: page.with(
    header: components.title(ctx.title),
    footer: align(right, counter(page).display("i")),
  )
  body
}

#let body-entry(ctx: (:), body) = {
  let metadata = entry-type-metadata.at(ctx.type)
  show: page.with(header: components.title(
    beginning: image.decode(
      utils.change-icon-color(raw-icon: metadata.icon, fill: white),
      height: 1em,
    ),
    end: ctx.date.display("[year]/[month]/[day]"),
    color: metadata.color,
    ctx.title,
  ), footer: [
    #line(length: 100%)
    #align(left, [
      *Designed by:* #ctx.author #h(2pt) \
      *Witnessed by:* #ctx.witness
      #h(1fr) #counter(page).display()
    ])
  ])
  body
}

#let appendix-entry(ctx: (:), body) = {
  show: page.with(
    header: components.title(ctx.title),
    footer: align(right, counter(page).display()),
  )

  body
}
