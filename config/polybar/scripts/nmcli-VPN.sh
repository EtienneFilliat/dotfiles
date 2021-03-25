#!/usr/bin/env bash


# Find Vpn name
vpn="$(nmcli -t -f name,type connection show --order name --active 2>/dev/null | grep vpn | head -1 | cut -d ':' -f 1)"


# Prints the current Vpn Status
# Useful for status bars like polybar, etc.
print_status() {
    if [ -n "$vpn" ]; then
        echo " $vpn"
    else
        echo ""
    fi
}

case "$1" in
    --disconnect)
        nmcli con down $vpn
        ;;
    *)
        print_status
        ;;
esac
