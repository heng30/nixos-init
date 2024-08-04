#!/bin/sh

function dwm_obs_running() {
    pid=`pidof obs`

    if [ "$pid" == "" ]; then
        echo ""
    else
        echo " 󰕧 "
    fi
}

