#!/bin/zsh

i=$(( $(/usr/local/bin/yabai -m query --spaces | grep '{' | wc -l) ))
id="split$RANDOM"

/usr/local/bin/yabai -m space --create
/usr/local/bin/yabai -m space $i --label $id
/usr/local/bin/yabai -m space $id --layout bsp
/usr/local/bin/yabai -m window --space $id
/usr/local/bin/yabai -m window --space $id
/usr/local/bin/yabai -m space --focus $id

