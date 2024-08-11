#!/bin/sh

function dwm_blender_running() {
    pid=`pidof blender`

    if [ "$pid" == "" ]; then
        echo ""
    else
        echo " 󰂫 "
    fi
}

