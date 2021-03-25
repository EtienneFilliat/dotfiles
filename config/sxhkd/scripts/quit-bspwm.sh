#!/usr/bin/env bash

# Rofi config path
dir="${HOME}/.config/rofi-glish"

# Message
msg() {
    rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
}

ans=$(rofi -dmenu -i -no-fixed-num-lines -p "Exit BSPWM ? : " -theme $dir/confirm.rasi)
if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
    bspc quit
elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
    exit 0
else
    msg
fi
