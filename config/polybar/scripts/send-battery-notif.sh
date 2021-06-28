#!/bin/bash

percent=$(cat /sys/class/power_supply/BAT0/capacity)
remaining=$(acpi | awk '{print $5}')
if [[ "$percent" < 10 ]]; then
    notifi-send -u critical 'Battery' 'Low battery ($percent)'
fi
