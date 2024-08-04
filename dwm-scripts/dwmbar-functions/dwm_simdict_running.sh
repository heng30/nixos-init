#!/bin/sh

function dwm_simdict_running() {
    pid=`pidof simdict`

    if [ "$pid" == "" ]; then
        echo ""
    else
        echo " 󰊿 "
    fi
}

