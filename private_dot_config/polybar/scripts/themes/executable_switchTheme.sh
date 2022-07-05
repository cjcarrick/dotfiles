#!/usr/bin/env bash

#
# ARGUMENTS
#
# $1: 'next' or 'prev' theme (or 'query')
#   - if not provided, will default to $defaultTheme
#

# a list of themes known to pywal. use `pywal --theme` to list them. Use "wal" as a theme name to have pywal automatically generate the colors
themes=(wal base16-onedark dkeg-owl dkeg-5725 "$HOME/.config/polybar/scripts/themes/colorschemes/nord-dark.json")

# the theme to use (from `themes`) by defualt
defaultTheme="wal"

# this is only here for backwards compatibility. use `cat .current` instead.

if [[ -e $HOME/.config/polybar/scripts/themes/.current ]]; then
    currentTheme=$(cat "$HOME/.config/polybar/scripts/themes/.current")
else
    currentTheme=$defaultTheme
fi

if [ "$1" = "query" ]; then
    if [[ "$currentTheme" =~ .json ]]; then
        echo "$currentTheme" | grep -oP '[^\/]+(?=\.json)'
    else
        echo "$currentTheme"
    fi
    exit 0
fi

if [ -n "$1" ]; then

    # find the index of the current theme in the array of image paths
    for i in "${!themes[@]}"; do
        if [[ "${themes[$i]}" =~ ${currentTheme} ]]; then
            currentThemeIndex=$i
            break 2
        else
            currentThemeIndex=0
        fi
    done

    echo "Current theme: $currentTheme (index: $currentThemeIndex)"
    targetIndex=$currentThemeIndex

    if [ "$1" = "prev" ]; then

        let targetIndex--

        # if targetIndex is already at index 0, rollover to the highest possible index
        if [ "$targetIndex" -lt 0 ]; then
            targetIndex=${#themes[@]}
            # corrects it to be 0-based
            let targetIndex--
        fi

        echo "Going to previus theme at index $targetIndex"

        target=${themes[targetIndex]}

    elif

        [ "$1" == "next" ]
    then

        let targetIndex++

        # if targetIndex is already at highest possible index, rollover to index 0
        if [ $(($targetIndex + 0)) -gt $((${#themes[@]} - 1)) ]; then
            #^^^            ^^^^^^ force $targetIndex to be a number, because aparantly bash doesn't think it is
            targetIndex=0
        fi

        target=${themes[targetIndex]}

    elif [ "$1" = "menu" ]; then

        options=$(printf '%s\n' "${themes[@]}")
        target=$(echo -e "$options" | rofi -theme "$HOME/.config/polybar/rofi/powermenu.rasi" -p "" -dmenu -selected-row 0)

    else
        echo "invalid argument '$1' given. must be either 'prev' or 'next'."
        exit 10
    fi

    echo "Target theme: $target (index: $targetIndex)"

else

    # find the index of the default theme in the array of image paths
    for i in "${!themes[@]}"; do
        if [[ "${themes[$i]}" =~ ${defaultTheme} ]]; then
            defaultThemeIndex=$i
            break 2
        else
            defaultThemeIndex=0
        fi
    done

    target=${themes[defaultThemeIndex]}
    echo "Setting default theme at '$target'"

fi

# COLOR THEME ------------------------------
# for changing the colors of everything-polybar, openbox, firefox, discord, etc

# save the current theme. maybe som eother scripts could use this information idk
echo "$target" >"$HOME/.config/polybar/scripts/themes/.current"
echo "111: $target"

if [[ "$target" = "wal" ]]; then
    echo "skdflsdjflsdjflskdjflsjdflkjsdlkf"
    wallpaperName=$($HOME/.config/polybar/scripts/switchWallpaper.sh query)
    # find the wallpaper path
    file=$(find ~/wallpapers/ | grep "$wallpaperName")

    echo "wallpaer: $wallpaperName"

    echo "file: $file"
    wal -i "$file" --backend haishoku -n
else
    echo "hhh"
    wal --theme "$target"
fi

# set theme
echo "target: $target"

# refresh discord
pywal-discord

# refresh firefox
python3 -m pywalfox update

source "$HOME/.cache/wal/colors.sh"

# change rofi colors
echo "* {
	  primary: ${color0}ff;
	  secondary: ${color1}ff;
      text: ${color7}FF;
	  faded: ${color7}4d;
	}" >"$HOME"/.config/polybar/rofi/colors.rasi

# POLYBAR RESTRUCTURING ----------------------
# for changing polybar's fonts, widths, etc.

# default is used when no section is found with the correct name
default=round

structure=$(sed -nr "/^\[mono\]/ { :l /^\s*[^#].*/ p; n; /^\[/ q; b l; }" "$HOME/.config/polybar/scripts/themes/polybar.ini")

