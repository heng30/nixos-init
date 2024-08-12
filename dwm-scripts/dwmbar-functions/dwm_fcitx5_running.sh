#!/bin/sh

function dwm_fcitx5_running() {
    pid=`pidof fcitx5`

    if [ "$pid" == "" ]; then
        echo ""
    else
        echo "  "
    fi
}

