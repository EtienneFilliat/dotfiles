#!/bin/bash

while true; do
        music=$($HOME/.config/polybar/scripts/get_spotify_status.sh)
	echo $music
        sleep 1
done 

