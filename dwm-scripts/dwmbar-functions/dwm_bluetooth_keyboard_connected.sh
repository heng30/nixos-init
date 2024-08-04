#!/bin/sh

function dwm_bluetooth_keyboard_connected() {
    running=`bluetoothctl  devices Connected | grep 00:18:00:3D:4D:76`

    if [ "$running" == "" ]; then
        echo ""
    else
        echo "  "
    fi
}

