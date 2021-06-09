#!/bin/bash

# Kill already running polybar
killall -q polybar

# Wait until shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config (~/.config/polybar/config)
polybar -c ~/.config/polybar/config.ini main &

# set up the two monitors for bspwm
external_monitor=$(xrandr --query | grep 'DP-1')
if [[ ! $external_monitor = *disconnected* ]]; then
    polybar -c ~/.config/polybar/config.ini main_external &
fi
