#!/usr/bin/env bash

paths=(
  "/usr/share/applications/firefox.desktop"
  "/usr/share/applications/spotify.desktop"
  "/usr/share/applications/blender.desktop"
  "/usr/share/applications/davinci-resolve.desktop"
  "/usr/share/applications/chromium.desktop"
  "/usr/share/applications/Alacritty.desktop"
  "/usr/share/applications/Meshroom.desktop"
  "/usr/share/applications/minecraft-launcher.desktop"
  "/usr/share/applications/visual-studio-code.desktop"
)

for appImage in "${paths[@]}"; do

  name=$(cat $appImage | awk -F "=" '/Name=/ {print $2}' | head -1)
  icon=$(cat $appImage | awk -F "=" '/Icon=/ {print $2}' | head -1)

  if [ $# -eq 0 ]; then
    echo -en "${name}\0icon\x1f${icon}\n"
  fi

  if [ $# -eq 1 ]; then
    chosen="$1"

    if [ "$chosen" == "$name" ]; then
      command=$(echo $appImage | grep -oP '\/\K[^\/]+$')
      gtk-launch "$command"
      exit
    fi
  fi

done
