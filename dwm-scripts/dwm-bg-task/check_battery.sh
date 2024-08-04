#!/bin/sh

function check_battery() {
    lower=20
    filepath="/tmp/battery-warning.dat"
    percent=$(acpi -b | grep "Battery 0" | awk -F ',' '{print $2}' | awk -F '%' '{print $1}');
    battery=$(printf "%d" $percent)

    if [ $lower -gt $((battery)) ]; then
        had_warned=$(cat $filepath)
        if [ $((had_warned)) -eq 1 ]; then
            exit
        fi
        echo "1" > $filepath
        battery-warning
    else
        echo "0" > $filepath
    fi
}

check_battery
exit
