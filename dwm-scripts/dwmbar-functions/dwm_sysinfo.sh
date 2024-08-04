#!/bin/sh

function dwm_temp(){
	test -f /sys/class/thermal/thermal_zone0/temp || return 0
	echo "$(head -c 2 /sys/class/thermal/thermal_zone0/temp)℃"
}

function dwm_disk() {
    rate=$(df -h | grep '/home$' | awk '{print $5}')
    echo $rate
}

function dwm_memory(){
	memtotal=$(grep -m1 'MemTotal:' /proc/meminfo | awk '{print $2}')
	memfree=$(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}')
    rate=$(((memtotal-memfree)*100/memtotal))
    echo $rate
}

function dwm_cpu() {
    read prevtotal previdle < /tmp/proc.stat
    read cpu a b c idle rest < /proc/stat

    total=$((a+b+c+idle))
    cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
    echo $total $idle > /tmp/proc.stat
    echo $cpu
}

function dwm_sysinfo() {
    printf "CPU %2d%% %3s %2d%% %3s" $(dwm_cpu) $(dwm_temp) $(dwm_memory) $(dwm_disk)
}
