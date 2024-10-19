#!/bin/sh

function dwm_bluetooth() {
    value=$(echo -e "show"|  bluetoothctl | grep 'Powered' | awk '{print $2}')

    if [ $value = 'yes' ]; then
        printf " 󰂰"
    else
        # printf "󰂲 "
        printf ""
    fi
}
