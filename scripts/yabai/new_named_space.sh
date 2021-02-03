#!/bin/zsh

n=$(( $(/usr/local/bin/yabai -m query --spaces | grep '{' | wc -l) ))

[[ $(/usr/local/bin/yabai -m query --spaces | grep "\"label\":\"$1\"" | wc -l | grep -o '\d') == 0 ]] \
	&& /usr/local/bin/yabai -m space --create \
	&& /usr/local/bin/yabai -m space $n --label $1 \
	&& /usr/local/bin/yabai -m space $1 --layout bsp

/usr/local/bin/yabai -m window --space $1
/usr/local/bin/yabai -m space --focus $1

