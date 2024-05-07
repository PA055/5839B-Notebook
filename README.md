## Making New Entries

To create a new entry you first need to create a new `.typ` file in the `entries/` folder. There are two different ways this project organizes entries. Either they are organized by project section (for example flywheel, or intake), or they are single entries.

To create a single entry, create a file with this path: `entries/<entry-name>/entry.typ`.
To create an entry in a group, create a file with the following path: `entries/<group-name>/<entry_name>.typ`

Once you've done this, you need to create an entry in the file.

```typ
#import "notebookinator/lib.typ": *
#import themes.radial: radial-theme, components, colors
#import components: *
#import colors: *

#show: create-body-entry.with(
  title: "<EDP Stage>: <your title here>",
  type: "<EDP Stage>",
  date: datetime(year: 1982, month: 1, day: 1),
)[
    Write your content here.
]
```

Make sure to read through the [Notebookinator](https://github.com/BattleCh1cken/notebookinator) documentation to see what components and options you can use while writing entries. You can also look at other existing entries as examples.

Once you're happy with your entry you'll need to add it to the entry index at `entries/entries.typ`, so that the `main.typ` file is aware of it.

Add the file to `entries/entries.typ` like this:

```typ
// Do this if its a single entry:
#include "./<entry_name>/entry.typ"

// Do this if its a group:
#include "./<group_name>/<entry_namge>.typ"
```

The order that the notebook renders the entries is dependent on the order that they're placed in this file, so make sure to put the `#include` in the correct spot.
