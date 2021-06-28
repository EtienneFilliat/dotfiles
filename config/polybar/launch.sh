#!/bin/bash

# Kill already running polybar
killall -q polybar

# Wait until shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config (~/.config/polybar/config)
polybar -c ~/.config/polybar/config.ini main &

# set up the two monitors for bspwm
external_monitor=$(xrandr --query | grep -w 'DP-1')
if [[ $external_monitor = *disconnected* ]]; then
    external_monitor=$(xrandr --query | grep -w 'DVI-I-2-1')
fi

# Extract External monitor name for Polybar
# echo "$(echo $external_monitor | cut -d" " -f1)"

if [[ ! $external_monitor = *disconnected* ]]; then
    MONITOR=$(echo $external_monitor | cut -d" " -f1) polybar -c ~/.config/polybar/config.ini main_external &
fi
