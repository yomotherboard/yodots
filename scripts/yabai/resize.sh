#!/bin/zsh

stepsize=40

IFS=$'\n'
xy=( $(/usr/local/bin/yabai -m query --windows | grep -En '"(id|x|y)":|"focused":1' | grep -B 3 '"focused":1' | head -n3) )
unset IFS

echo "$1"
echo "$xy[1]"
echo "$xy[2]"
id=${${xy[1]##*:}%,}
x=${${xy[2]##*:}%,}
y=${${xy[3]##*:}%,}

if [ $1 = right ]
then
	[[ "$x" = 0.* ]] \
			&& /usr/local/bin/yabai -m window $id --resize right:$stepsize:0 \
			|| /usr/local/bin/yabai -m window $id --resize left:$stepsize:0
fi

if [ $1 = left ]
then
	[[ "$x" = 0.* ]] \
			&& /usr/local/bin/yabai -m window $id --resize right:-$stepsize:0 \
			|| /usr/local/bin/yabai -m window $id --resize left:-$stepsize:0
fi

if [ $1 = bottom ]
then
	[[ "$y" = 0.* ]] \
			&& /usr/local/bin/yabai -m window $id --resize bottom:0:$stepsize \
			|| /usr/local/bin/yabai -m window $id --resize top:0:$stepsize
fi

if [ $1 = top ]
then
	[[ "$y" = 0.* ]] \
			&& /usr/local/bin/yabai -m window $id --resize bottom:0:-$stepsize \
			|| /usr/local/bin/yabai -m window $id --resize top:0:-$stepsize
fi
