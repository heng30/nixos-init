#!/bin/sh

function dwm_musicbox_running() {
    pid=`pidof musicbox`

    if [ "$pid" == "" ]; then
        echo ""
    else
        echo " 󰫔 "
    fi
}

