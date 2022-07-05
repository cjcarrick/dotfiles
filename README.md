## dotfiles

_Managed with [chezmoi](https://www.chezmoi.io) (`brew install chezmoi`, `pacman -S chezmoi`)_

### Adding these to a new machine

1. Init with:

```sh
chezmoi init https://github.com/cervidae/dotfiles.git
```

1. Show what will be changed

```sh
chezmoi diff
```

1. Apply changes:

```sh
chezmoi apply -v
```

1. Apply changes later:

```sh
chezmoi update -v
```

### Adding to a new machine and installing all at once:

```sh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --one-shot cervodae
```

This will also remove chezmoi from the system, so you won't be able to update when there are changes made later.

### Modifying files

```sh
chezmoi edit $FILE
```

or edit the files in the source directory, by running

```sh
chezmoi cd
```

and then

```sh
chezmoi apply
```

when finished.

or edit them in the home directory however you want, and then running

```sh
chezmoi [re-]add $FILE
```
