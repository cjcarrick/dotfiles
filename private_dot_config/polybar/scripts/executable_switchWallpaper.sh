#!/usr/bin/env bash

#
# ARGUMENTS
#
# $1: 'next' or 'prev' wallpaper (or 'query')
#   - if not provided, will default to $defaultWallpaper
#

# wallpapers are set in alphabetical order
targetDir=~/wallpapers
# labels=(240sx evo jet la polar\ bears senna wave window wrx)

# automatically find labels
# SAVEIFS=$IFS   # Save current IFS
# IFS=$'\n'      # Change IFS to new line
# # labels=( $(  ) )# split to array $names
# IFS=$SAVEIFS   # Restore IFS
labelsStr=$(ls ~/wallpapers | grep -oP '.*(?=\.)')
readarray -t labels <<<"$labelsStr"

# the wallpaper to use (from the targetDir) by defualt
defaultWallpaper=evo

# find all images in target directory
targets=($targetDir/*.*)

# this is only here for backwards compatibility. use `cat ~/wallpapers/.current` instead.
if [ "$1" = "query" ]; then
    # update the saved one in case it got borked for whatever reason
    grep -o '/.*\.[a-zA-Z]*' "$HOME/.fehbg" >"$HOME/wallpapers/.current"
    path=$(cat "$HOME/wallpapers/.current")
    # echo $path
    name=$(echo "$path" | grep -oP '[^\/]+(?=\.)')
    echo "$name"
    exit 0
fi

if [[ "$1" = "menu" ]]; then

    options=$(printf '%s\n' "${targets[@]}")
    target=$(echo -e "$options" | rofi -theme "$HOME/.config/polybar/rofi/powermenu.rasi" -p "" -dmenu -selected-row 0)

elif [[ "$1" = "next" || "$1" = "prev" ]]; then

    currentWallpaper=$(cat "$HOME/wallpapers/.current")

    # find the index of the current wallpaper in the array of image paths
    for i in "${!targets[@]}"; do
        if [[ "${targets[$i]}" =~ ${currentWallpaper} ]]; then
            currentWallpaperIndex=$i
            break 2
        else
            currentWallpaperIndex=0
        fi
    done

    echo "Current wallpaper: $currentWallpaper (index: $currentWallpaperIndex)"
    targetIndex=$currentWallpaperIndex

    if [ "$1" = "prev" ]; then

        let targetIndex--

        # if targetIndex is already at index 0, rollover to the highest possible index
        if [ "$targetIndex" -lt 0 ]; then
            targetIndex=${#targets[@]}
            # corrects it to be 0-based
            let targetIndex--
        fi

        echo "Going to previus wallpaper at index $targetIndex"

    elif
        [ "$1" == "next" ]
    then

        let targetIndex++

        # if targetIndex is already at highest possible index, rollover to index 0
        if [ $(($targetIndex + 0)) -gt $((${#targets[@]} - 1)) ]; then
            #^^^            ^^^^^^ force $targetIndex to be a number, because aparantly bash doesn't think it is
            targetIndex=0
        fi

    fi

    # find the name (not index) of the wallpaper to be used
    target=${targets[targetIndex]}
    echo "setting wallpaper at '$target'"
else

    # find the index of the default wallpaper in the array of image paths
    for i in "${!targets[@]}"; do
        if [[ "${targets[$i]}" =~ ${defaultWallpaper} ]]; then
            defaultWallpaperIndex=$i
            break 2
        else
            defaultWallpaperIndex=0
        fi
    done

    # defaultWallpaperIndex=$(printf '%s\n' "${targets[@]}" | grep -n ${defaultWallpaper} | grep -oP '^[0-9]++')
    # # grep -n is 1-based, but in bash the array indices are 0-based. This corrects that
    # ((defaultWallpaperIndex--)) || true

    target=${targets[defaultWallpaperIndex]}
    echo "Setting default wallpaper at '$target'"

fi

# set wallpaper
echo "target: $target"
feh --bg-scale "$target" &

# save the current wallpaper. maybe som eother scripts could use this information idk
echo "$target" >$targetDir/.current

# if we need to set the pywal colors too
if [[ $(cat "$HOME/.config/polybar/scripts/themes/.current") = "wal" ]]; then
    # set colors
    wal -i "$target" --backend haishoku

    # refresh firefox
    python3 -m pywalfox update

    # refresh discord
    pywal-discord

    # change rofi colors

    source "$HOME/.cache/wal/colors.sh"

    echo "* {
	  primary: ${color0}ff;
	  secondary: ${color1}ff;
      text: ${color7}FF;
	  faded: ${color7}4d;
	}" >"$HOME"/.config/polybar/rofi/colors.rasi
fi
