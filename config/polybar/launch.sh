#!/bin/bash

# Kill already running polybar
killall -q polybar

# Wait until shutdown
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch Polybar, using default config (~/.config/polybar/config)
polybar -c ~/.config/polybar/config.ini main &
