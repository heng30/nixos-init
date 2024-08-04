#!/bin/sh

function low_battery_suspend() {
    lower=10

    _=$(acpi -b | grep "Battery 0" | grep "Discharging")

    if [ $? -eq 0 ]; then
        percent=$(acpi -b | grep "Battery 0" | awk -F ',' '{print $2}' | awk -F '%' '{print $1}')
        battery=$(printf "%d" $percent)
        if [ $lower -gt $((battery)) ]; then
            sysctemctl suspend
        fi
    fi
}

low_battery_suspend
exit
