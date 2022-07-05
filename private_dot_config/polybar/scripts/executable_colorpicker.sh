#!/usr/bin/env bash

# usage:
# $ rgb2hex 168 255 124
# a8ff7c
rgb2hex() {
  for var in "$@"; do
    printf '%x' "$var"
  done
  printf '\n'
}

hex2rgb() {
  hex=$($1 | grep -oP '[^#]*')
  printf "%d %d %d\n" 0x${hex:0:2} 0x${hex:2:2} 0x${hex:4:2}
}

hex=$(xcolor | grep -oP '[0-9a-zA-Z#]*')

# copy color
echo "$hex" | xclip -selection clipboard

tmp=$(date +%s)

# create preview image
convert -size 1x1 xc:#d5aadf /tmp/$tmp.png

# do this with timeout in case the user never ends up pushing a button
answer=$(notify-send.py 'Color Picker' "$hex Copied" \
  --hint string:image-path:file://tmp/$tmp.png \
  -t 10000000 \
  --action hex:\ HEX rgb:\ RGB hsl:\ HSL)

if [[ $answer =~ rgb ]]; then
  hex2rgb "$hex" | xclip -selection clipboard
fi

if [[ $answer =~ hex ]]; then
  echo "$hex" | xclip -selection clipboard
fi

if [[ $answer =~ hsl ]]; then
  hex2rgb "$hex" | xclip -selection clipboard
fi
