#!/usr/bin/env bash

if [[ $1 == '-s' ]]; then
  f="/home/cervidae/Pictures/$(date +%s).png"
  maim -s "$f" && readlink -f "$f" | xclip -selection c
elif [[ $1 == '-p' ]]; then
  xcolor | xclip -selection clipboard
else
  maim -s | xclip -selection clipboard -t image/png
fi