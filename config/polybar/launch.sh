#!/bin/bash

# Kill already running polybar
killall -q polybar

# Wait until shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# From https://github.com/polybar/polybar/issues/763#issuecomment-331604987
# Querry ALL Available screens

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        [[ $m == 'eDP-1' ]] && bar='main' || bar='main_external'
        echo "Monitor [$m] - Bar: [$bar]"
        DEFAULT_WIRED_NETWORK_INTERFACE=$(ip route | grep '^default.*enp.*$' | awk '{print $5}' | head -n1) \
        MONITOR=$m \
            polybar -c ~/.config/polybar/config.ini $bar &
    done
fi
