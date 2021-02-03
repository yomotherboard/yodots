#!/bin/zsh

i=$(( $(/usr/local/bin/yabai -m query --spaces | grep '{' | wc -l) ))
space_id="custom$1"

echo "$space_id" > /dev/ttys000

[[ $(/usr/local/bin/yabai -m query --spaces | grep "\"label\":\"custom$1\"" | wc -l | grep -o '\d') == 0 ]] \
	&& /usr/local/bin/yabai -m space --create \
	&& /usr/local/bin/yabai -m space $i --label $space_id \
	&& /usr/local/bin/yabai -m space $space_id --layout bsp

/usr/local/bin/yabai -m window --space $space_id
/usr/local/bin/yabai -m space --focus $space_id

