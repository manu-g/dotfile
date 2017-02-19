#!/bin/sh

if [ `xrandr | grep -c ' connected '` -eq 2 ]; then # dual-monitor
    if [ `xrandr | grep VGA1 | grep -c ' connected '` -eq 1 ]; then
        echo "dual"
        #sh ~/.screenlayout/dualmonitor.sh
    fi
    if [ `xrandr | grep DP | grep -c ' connected '` -eq 1 ]; then
        echo "DP"
    fi
    if [ `xrandr | grep HDMI | grep -c ' connected '` -eq 1 ]; then
        echo "HDMI"
    fi
fi


