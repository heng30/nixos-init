#!/bin/sh

function dwm_alsa () {
    vol=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    mute="$(amixer get Master | grep "off")"

    is_master=$(echo $vol)

    # plug USB sound card
    if [ "$is_master" == "" ]; then
        vol=$(amixer get Speaker | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
        mute="$(amixer get Speaker | sed -n '$p' | cut -d] -f3 | cut -d[ -f2)"
    fi

    if [ "$vol" -eq 0 ] || [ "$mute" != "" ]; then
        printf "󰖁 "
    else
        printf  "󰕾 %s%%" "$vol"
    fi
}
