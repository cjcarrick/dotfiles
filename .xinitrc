# Used by other programs like i3
export TERMINAL="alacritty"

# Faster key repeat speed
xset r rate 200 65

# Disable screen saver blanking
xset s off -dpms

# Set DPI: xrandr and xrdb both need to be set.
# xrdb is normally merged from a .Xresources file, but it can also be set from
# stdin. This way you can have it all in one file.
xrandr --dpi 144
xrdb -merge <<< "Xft.dpi: 144"
xrdb -merge <<< "Xcursor.size: 32"

# List connected displays and their current settings with 'xrandr'
xrandr --output DP-0 --rotate right --right-of DP-2
xrandr --output DP-2 --primary --preferred --pos 0x1680

# Caps lock as compose key
setxkbmap -option compose:caps

# Compositor
picom &

# Window manager
i3

