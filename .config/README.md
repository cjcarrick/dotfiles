# My dotfiles

# Notes

Some configuration files are Linux or MacOS specific. Only copy what you need.

## ZSH


I don't use a plugin manager so you'll have to install these and source them
manually.

- (zsh-users/zsh-syntax-highlighting)[https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md]

## Neovim

Configuration is based on the latest nightly build of neovim.

Fern.vim uses nerfont.vim to draw icons. I think these icons are too big. The
font (fantasque-sans-mono) at the root of this repo includes the icons from
(seti)[https://github.com/jesseweed/seti-ui/tree/master/styles/_fonts/seti],
which are only one character wide. In addition, there are a lot more icons in
this seti than in normal Nerd Font patched font. All of the old icons that are
too big are still in the font.

After installing all the plugins, copy the json files from
.config/nvim/icons/json to nerfont.vim/assets/\*.json

TODO: find a way to automate this and/or remove clutter from .config/nvim.

There are also a few colorschemes in there. Ideally, the 16color.lua one would
be used for maximum compatibility and because alacritty can hot reload the
colors that way. This basically just uses whatever colors are set in the
terminal. But working with 16 colors is limiting, and for more variation you may
want to use one of the other colorschemes.

## dmenu

- Uses [cjcarrick/dmenu]

## i3

- Uses [i3status-rust](https://github.com/greshake/i3status-rust)

