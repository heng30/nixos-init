#!/bin/sh

function net_name(){
    wlan_id=$(rfkill list all | grep -e 'Wireless LAN' | cut -d ':' -f1)

    if [ $? -eq 0 ]; then
        rfkill list $wlan_id | grep -e 'yes' > /dev/null
        if [ $? -eq 0 ]; then
            printf "F"
            exit
        fi
    fi

    value=$(wpa_cli status | grep ^ssid | awk -F '=' '{print $2}')
    if [ $value != "" ];then
        printf "$value "
    else
        printf ""
    fi
}


function dwm_net_type(){
    printf "$(net_name)"
}

