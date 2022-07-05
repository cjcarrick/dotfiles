#!/usr/bin/env bash

# ask nvidia what is happening
# RUN IT LIKE THIS: `./scripts/gpu.sh 2>/dev/null` to avoid the errors. idk how to make them go away

REQ=$(nvidia-smi -q)

# extract things from that request. 

gpuUsed=$(echo "$REQ" | perl -0 -lne 'print $& if m/Utilization[\w\W]*?Gpu *: \K[0-9\.]*/')
# gpuWatts=$(echo "$REQ" | perl -0 -lne 'print $& if m/Power Readings[\w\W]*?Power Draw *: \K[0-9\.]*/')
# gpuClock=$(echo "$REQ" | perl -0 -lne 'print $& if m/Clocks[\w\W]*?Graphics *: \K[0-9\.]*/')
# gpuTemp=$(echo "$REQ" | perl -0 -lne 'print $& if m/Temperature[\w\W]*?GPU Current Temp *: \K[0-9\.]*/')

vramUsed=$(echo "$REQ" | perl -0 -lne 'print $& if m/FB Memory Usage[\w\W]*?Used *: \K[0-9\.]*/')
# vramAvalible=$(echo "$REQ" | perl -0 -lne 'print $& if m/FB Memory Usage[\w\W]*?Free *: \K[0-9\.]*/')
# vramMax=$(echo "$REQ" | perl -0 -lne 'print $& if m/FB Memory Usage[\w\W]*?Total *: \K[0-9\.]*/')
# vramClock=$(echo "$REQ" | perl -0 -lne 'print $& if m/Clocks[\w\W]*?Memory *: \K[0-9\.]*/')

# There are more things than just these, call `nvidia-smi -q` yourself and see.

# Echo out whatever you want.
echo "${gpuUsed}% (${vramUsed} MiB)"
