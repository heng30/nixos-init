#!/bin/sh

percent=$(acpi -b | grep "Battery 0" | awk -F ',' '{print $2}');
percent=$(echo "$percent" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
icon="󰂄";
if $(acpi -b | grep "Battery 0" | grep --quiet Discharging); then
    icon="󱊡";
fi

echo "$icon $percent" > /tmp/battery.dat;

