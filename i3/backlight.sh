#!/bin/sh

min() {
    xbacklight -dec $1
    bright=$( xbacklight -get )
    notify-send -t 500 -i ~/.config/i3/brightnessD.png " -- $bright"
}

max() {
    xbacklight -inc $1
    bright=$(xbacklight -get)
    notify-send -t 500 -i ~/.config/i3/brightnessB.png " -- $bright"
}

if [ "min" = $1 ]; then
    min $2
else
    max $2
fi

exit
