#!/bin/bash

# set up the two monitors for bspwm
# NOTE This is a simplistic approach because I already know the settings I
# want to apply.

# eDP-1: Integrated screen
# DP-1: Personal USB-C Hub outputing on HDMI
# DVI-I-2-1: Work USB-C Hub outputing on HDMI

external_monitor=$(xrandr --query | grep -w 'DP-1')
if [[ $external_monitor = *disconnected* ]]; then
    external_monitor=$(xrandr --query | grep -w 'DVI-I-2-1')
fi

if [[ ! $external_monitor = *disconnected* ]]; then
    external_monitor=$(echo $external_monitor | cut -d" " -f1)
    echo "Monitor $external_monitor connected"
    xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal --output $external_monitor --mode 1920x1080 --rotate normal --right-of eDP-1
else
    echo "Monitor disconnected"
    xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal --output DP-1 --off
fi
