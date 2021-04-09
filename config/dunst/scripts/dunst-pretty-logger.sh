#!/bin/bash

inp=${@}

urgency=$(echo $inp | rev | cut -d' ' -f 1 | rev)
info=$(echo $inp | sed -E -e 's/(LOW|NORMAL|CRITICAL)//g')
echo "$(date +"%b %d %T") $(uname --nodename): [$urgency] $info" >> /tmp/dunst.log
