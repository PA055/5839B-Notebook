#import "./packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components
#import "./utils.typ": get-page-number

#import "./glossary.typ"

#create-appendix-entry(title: "Glossary")[
  #components.glossary()
]