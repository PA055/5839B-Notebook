## Installation

> This installation process is temporary, as we wait for Typst to overhaul its process for packaging templates and packages.

The best way to install the Notebookinator is as a local package. Make sure you
have the following software installed on your computer:

- [Typst](https://github.com/casey/just#installation)
- [Git](https://github.com/casey/just#installation)
- [VSCode](https://code.visualstudio.com)
- [just](https://github.com/casey/just#installation)

Once you've installed everything, simply run the following commands:

```bash
git clone https://github.com/BattleCh1cken/notebookinator
cd notebookinator
just install
```
> If you're running this on Windows, you'll need to run these commands in a sh shell, like git-bash or the shell packaged with Cygwin or GitHub Desktop.

## Making New Entries

To create a new entry you first need to create a new `.typ` file in the `entries/` folder. There are two different ways this project organizes entries. Either they are organized by project section (for example flywheel, or intake), or they are single entries.

To create a single entry, create a file with this path: `entries/<entry-name>/entry.typ`.
To create an entry in a group, create a file with the following path: `entries/<group-name>/<entry_name>.typ`

Once you've done this, you need to create an entry in the file.

```typ
#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "<EDP Stage>: <your title here>",
  type: "<EDP Stage>",
  date: datetime(year: 1982, month: 1, day: 1),
  author: "Praful Adiga",
  witness: "Davis Bodami",
)

Write your content here.

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
