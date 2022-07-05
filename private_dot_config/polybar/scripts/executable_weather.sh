#!/usr/bin/env bash

# a nicely formatted weather script
# depends: jq

separator=" - "

# ----------------

# initial request. only do this once, so you dont waste time grabbing the same info 20 times
REQ=$(curl -s 'wttr.in/?format=j1')

# grab each thing from the request
location=$(echo "$REQ" | jq '.nearest_area[0].areaName[0].value')

condition=$(echo "$REQ" | jq '.current_condition[0].weatherCode' | grep -o '[0-9]*')

temp=$(echo "$REQ" | jq '.current_condition[0].temp_F' | grep -o '[0-9]*')
minTemp=$(echo "$REQ" | jq '.weather[0].mintempF' | grep -o '[0-9]*')
maxTemp=$(echo "$REQ" | jq '.weather[0].maxtempF' | grep -o '[0-9]*')

precipInches=$(echo "$REQ" | jq '.current_condition[0].precipInches' | grep -o '[0-9\.]*')
windDir=$(echo "$REQ" | jq '.current_condition[0].winddirDegree' | grep -o '[0-9]*')
windSpeed=$(echo "$REQ" | jq '.current_condition[0].windspeedMiles' | grep -o '[0-9]*')
uvIndex=$(echo "$REQ" | jq '.current_condition[0].uvIndex' | grep -o '[0-9]*')

# come up with the average chance of rain, snow, sun, and wind for the instant.
# wttr.in has 8 hourly reports avalible per day. so get which set of hours we're in, and get the chances for that interval
hour=$(("$(date +%k)" / 3))
rainChance=$(echo "$REQ" | jq ".weather[0].hourly[$hour].chanceofrain" | grep -o "[0-9]*")
if [[ "$rainChance" -gt 5 ]]; then
    rainChance="${separator}${rainChance}% rainy"
    #rainChance="${separator}${rainChance}% rainy${separator}${precipInches} inches"
else
    rainChance=""
fi

snowChance=$(echo "$REQ" | jq ".weather[0].hourly[$hour].chanceofsnow" | grep -o "[0-9]*")
if [[ "$snowChance" -gt 5 ]]; then
    snowChance="${separator}${snowChance}% snowy"
else
    snowChance=""
fi

sunChance=$(echo "$REQ" | jq ".weather[0].hourly[$hour].chanceofsunshine" | grep -o "[0-9]*")
if [[ "$sunChance" -gt 5 ]]; then
    sunChance="${separator}${sunChance}% sunny"
else
    sunChance=""
fi

thunderChance=$(echo "$REQ" | jq ".weather[0].hourly[$hour].chanceofthunder" | grep -o "[0-9]*")
if [[ "$thunderChance" -gt 5 ]]; then
    thunderChance="${separator}${thunderChance}% stormy"
else
    thunderChance=""
fi

windChance=$(echo "$REQ" | jq ".weather[0].hourly[$hour].chanceofwindy" | grep -o "[0-9]*")
if [[ "$windChance" -gt 5 ]]; then
    windChance="${separator}${windChance}% windy"
    #windChance="${separator}${windChance}% windy${separator}$windSpeed mph wind"
else
    windChance=""
fi

# come up with weather icons
conditionFormatted="$condition"
case "$condition" in
113 | Sunny)
    conditionFormatted=""
    ;;
116 | PartlyCloudy)
    conditionFormatted=""
    ;;
119 | Cloudy)
    conditionFormatted=""
    ;;
122 | VeryCloudy)
    conditionFormatted=""
    ;;
143 | Fog)
    conditionFormatted=""
    ;;
176 | LightShowers)
    conditionFormatted=""
    ;;
179 | LightSleetShowers)
    conditionFormatted=""
    ;;
182 | LightSleet)
    conditionFormatted=""
    ;;
185 | LightSleet)
    conditionFormatted=""
    ;;
200 | ThunderyShowers)
    conditionFormatted=""
    ;;
227 | LightSnow)
    conditionFormatted=""
    ;;
230 | HeavySnow)
    conditionFormatted=""
    ;;
248 | Fog)
    conditionFormatted=""
    ;;
260 | Fog)
    conditionFormatted=""
    ;;
263 | LightShowers)
    conditionFormatted=""
    ;;
266 | LightRain)
    conditionFormatted=""
    ;;
281 | LightSleet)
    conditionFormatted=""
    ;;
284 | LightSleet)
    conditionFormatted=""
    ;;
293 | LightRain)
    conditionFormatted=""
    ;;
296 | LightRain)
    conditionFormatted=""
    ;;
299 | HeavyShowers)
    conditionFormatted=""
    ;;
302 | HeavyRain)
    conditionFormatted=""
    ;;
305 | HeavyShowers)
    conditionFormatted=""
    ;;
308 | HeavyRain)
    conditionFormatted=""
    ;;
311 | LightSleet)
    conditionFormatted=""
    ;;
314 | LightSleet)
    conditionFormatted=""
    ;;
317 | LightSleet)
    conditionFormatted=""
    ;;
320 | LightSnow)
    conditionFormatted=""
    ;;
323 | LightSnowShowers)
    conditionFormatted=""
    ;;
326 | LightSnowShowers)
    conditionFormatted=""
    ;;
329 | HeavySnow)
    conditionFormatted=""
    ;;
332 | HeavySnow)
    conditionFormatted=""
    ;;
335 | HeavySnowShowers)
    conditionFormatted=""
    ;;
338 | HeavySnow)
    conditionFormatted=""
    ;;
350 | LightSleet)
    conditionFormatted=""
    ;;
353 | LightShowers)
    conditionFormatted=""
    ;;
356 | HeavyShowers)
    conditionFormatted=""
    ;;
359 | HeavyRain)
    conditionFormatted=""
    ;;
362 | LightSleetShowers)
    conditionFormatted=""
    ;;
365 | LightSleetShowers)
    conditionFormatted=""
    ;;
368 | LightSnowShowers)
    conditionFormatted=""
    ;;
371 | HeavySnowShowers)
    conditionFormatted=""
    ;;
374 | LightSleetShowers)
    conditionFormatted=""
    ;;
377 | LightSleet)
    conditionFormatted=""
    ;;
386 | ThunderyShowers)
    conditionFormatted=""
    ;;
389 | ThunderyHeavyRain)
    conditionFormatted=""
    ;;
392 | ThunderySnowShowers)
    conditionFormatted=""
    ;;
395 | HeavySnowShowers)
    conditionFormatted=""
    ;;
*)
    conditionFormatted="$condition"
    ;;
esac

# final message
echo " ${conditionFormatted} ${temp}°${separator}L: ${minTemp}° H: ${maxTemp}°${rainChance}${snowChance}${sunChance}${thunderChance}${windChance}"
