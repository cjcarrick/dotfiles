#!/usr/bin/env bash

# RUN IT LIKE THIS: `./scripts/cpu.sh 2>/dev/null` to avoid the errors. idk how to make them go away

usage=$(cat /proc/stat | grep cpu | tail -1 | awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}' | awk '{print 100-$1}' | grep -oP '[0-9](?=\.)')
temp=$(sensors | perl -0 -lne 'print $& if m/Package id 0: *\+\K[0-9]*/')

echo "$usage% ($temp°)"
