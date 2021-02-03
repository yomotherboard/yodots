#!/bin/zsh

space_to_remove=$(yabai -m query --spaces --space mouse | grep 'index' | grep -Eo '\d+')

[[ $(yabai -m query --spaces --space mouse | grep 'windows' | grep -o '\[.*\]') == "[]" ]] \
		&& yabai -m space --focus prev \
		&& sleep .1 \
		&& yabai -m space $space_to_remove --destroy
