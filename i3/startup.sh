#!/bin/sh

nm-applet &
xfce4-power-manager &
kupfer --no-splash &
#/opt/kupfer/bin/kupfer.in --no-splash &
redshift &

if [ -n "$GDMSESSION" ]; then
    case "$XDG_GREETER_DATA_DIR" in
        *lightdm*)
            which dm-tool > /dev/null && echo "XScreenSaver.newLoginCommand: dm-tool switch-to-greeter" | xrdb -merge
            ;;
        *)
            which gdmflexiserver > /dev/null && echo "XScreenSaver.newLoginCommand: gdmflexiserver -ls" | xrdb -merge
            ;;
    esac
fi

if [ -n "$KDE_FULL_SESSION" ] && which kdmctl > /dev/null; then
    echo "XScreenSaver.newLoginCommand: kdmctl reserve" | xrdb -merge
fi

#xscreensaver -no-splash &
#light-locker &
# hamster-time-tracker &
xss-lock i3lock &

# backlight 50 %
xbacklight -set 50

# start ranger
# terminator -b --layout=quake -x ranger &

# set keyboard layout
setxkbmap de

# set screen properties
sh ~/.config/i3/screen.sh

# background wallpaper
#sleep 1;
#feh --bg-scale --randomize /mnt/Daten/Bilder/wallpaper/*
feh --bg-scale /mnt/Daten/Bilder/black.png
#feh --bg-scale /usr/share/images/desktop-base

# remember to backup and update the system
if [ $(date +%u) -ge 6 ]; then
    notify-send -i /home/manuel/.config/i3/backup.jpg "today ->  backup and update"
fi

# disable bluetooth at startup
bluetooth off &
