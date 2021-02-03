#!/usr/bin/env sh

wi=$(/usr/local/bin/yabai -m query --windows | awk '/'$1'/{ app_found=1 } /space/{ if(app_found) {gsub(/"space":|,/,""); print $1; exit 0} }')

/usr/local/bin/yabai -m space --focus $wi

open -a "$1"
