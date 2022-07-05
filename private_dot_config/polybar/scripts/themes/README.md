## Switching Themes

- This themes/ section is used to apply color schemes to the entire system.
- Relies on pywal
- Custom themes must be formatted like this:

  ```json
  {
    "special": {
      "background": "#2E3440",
      "foreground": "#E5E9F0",
      "cursor": "#E5E9F0"
    },
    "colors": {
      "color0": "#2f3541",
      "color1": "#444d5f",
      "color2": "#5d81ac",
      "color3": "#879bcf",
      "color4": "#878fcf",
      "color5": "#9592d3",
      "color6": "#b5aadf",
      "color7": "#d8dee9",

      "color8": "#3c4353",
      "color9": "#4d576a",
      "color10": "#81a1c1",
      "color11": "#8f9fc7",
      "color12": "#8f96c7",
      "color13": "#9c99cc",
      "color14": "#b9b0d9",
      "color15": "#e5e9f0"
    }
  }
  ```

  This is the standard format pywal expects with its `--theme` option. See [here](https://github.com/dylanaraps/pywal/tree/master/pywal/colorschemes) for more examples.

- When you use switchTheme.sh and set the theme to `wal`, the colors will automatically regerate next time you run ../switchWallpaper.sh.

- Supply pathnames to all the themes you want to use at the top of the file, along with a default theme:

  ```sh

  # a list of themes known to pywal. use `pywal --theme` to list them. Use "wal" as a theme name to have pywal automatically generate the colors
  themes=(wal base16-onedark dkeg-owl dkeg-5725 "$HOME/.config/polybar/scripts/themes/colorschemes/nord-dark.json")

  # the theme to use (from `themes`) by defualt
  defaultTheme="wal"

  ```

  Optional values are `wal`, any of the themes listed by `pywal --theme`, and the path to .json themes you have made.
