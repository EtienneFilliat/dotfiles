#!/usr/bin/env bash

dir="${HOME}/.config/rofi-glish"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
suspend="  Sleep"
logout=" Logout"

# Confirmation
confirm_exit() {
    rofi -dmenu -i -no-fixed-num-lines -p "Are You Sure? : " \
        -theme $dir/confirm.rasi
}

# Message
msg() {
    rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
$shutdown)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
        systemctl poweroff
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
        exit 0
    else
        msg
    fi
    ;;
$reboot)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
        systemctl reboot
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
        exit 0
    else
        msg
    fi
    ;;
$lock)
    # killall -qw picom
    pkill -xu $EUID -USR1 dunst
    betterlockscreen --lock
    pkill -xu $EUID -USR2 dunst
    # if
    # picom --experimental-backend &
    ;;
$suspend)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
        mpc -q pause
        amixer set Master mute
        systemctl suspend
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
        exit 0
    else
        msg
    fi
    ;;
$logout)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
        bspc quit
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
        exit 0
    else
        msg
    fi
    ;;
esac
