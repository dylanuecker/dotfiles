#!/bin/sh
geolocation=$(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | awk 'OFS=":" {print $3,$5}' | tr -d ',}' | tr ':' ',')
temp=$(curl "wttr.in/$geolocation?format=%f" | cut -c 2-)
echo ${temp%?}
