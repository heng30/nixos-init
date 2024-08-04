#!/bin/sh

function dwm_uptime() {
    M=60
    H=$((60 * M))
    D=$((24 * H))

    d=0
    h=0
    m=0
    s=$(( $(cat /proc/uptime | cut -d' ' -f1 | cut -d'.' -f1) ))

    if [ $s -gt $D ]; then
        d=$((s / D))
        s=$(( s - d * D ))
    fi

    if [ $s -gt $H ]; then
        h=$((s / H))
        s=$(( s - h * H ))
    fi

    if [ $s -gt $M ]; then
        m=$((s / M))
        s=$(( s - m * M ))
    fi

    printf "%02d %02d:%02d" $d $h $m
}
