#!/bin/sh

# 获取屏幕亮度
function dwm_backlight () {
    percent=$(brightnessctl -m | awk -F ',' '{print $4}');
    printf " %3s" "$percent"
}
