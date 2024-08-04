#!/bin/sh

 vol=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
 mute="$(amixer get Master | grep "off")"

is_master=$(echo $vol)

if [ "$is_master" == "" ]; then
    vol=$(amixer get Speaker | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    mute="$(amixer get Speaker | grep "off")"
fi

if [ "$mute" != "" ]; then
    amixer sset Speaker on
    amixer sset Headphone on
    amixer sset Master on
else
    amixer sset Speaker off
    amixer sset Headphone off
    amixer sset Master off
fi
