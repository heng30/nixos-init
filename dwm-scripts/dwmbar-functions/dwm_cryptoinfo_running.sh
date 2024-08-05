#!/bin/sh

function dwm_cryptoinfo_running() {
    pid=`pidof cryptoinfo`

    if [ "$pid" == "" ]; then
        echo ""
    else
        echo "  "
    fi
}

