#!/usr/bin/env bash

# https://github.com/polybar/polybar/issues/1485#issuecomment-432535158

killall -q polybar

polybar -c ~/.config/polybar/launch/default 2>&1 | tee -a /tmp/polybar1.log & disown