#!/bin/sh

function dwm_net_statistics() {
    K=1024
    M=$((1024 * 1024))
    G=$((1024 * 1024 * 1024))
    dd="M"
    ld="M"

    read download_old upload_old time_old < /tmp/net.stat

    interface="wlp0s20f3"

    download=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print $1}')

    upload=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print $9}')

    time_now=$(date "+%s")
    time_del=$(( time_now - time_old ))

    if [ $time_del -eq 0 ]; then
        time_del=1;
    fi

    echo $download $upload $time_now > /tmp/net.stat

    upload_rate=$(( (upload - upload_old) / (K * time_del) ))
    download_rate=$(( (download - download_old) / (K * time_del) ))

    if [ $upload -gt $G ]; then
        upload=$(expr $upload / $G)
        ld="G"
    else
        upload=$(expr $upload / $M)
    fi

    if [ $download -gt $G ]; then
        download=$(expr $download / $G)
        dd="G"
    else
        download=$(expr $download / $M)
    fi

    printf "%4dK/%d%s▾%3dK/%d%s▴" $download_rate $download $dd $upload_rate $upload $ld
}

