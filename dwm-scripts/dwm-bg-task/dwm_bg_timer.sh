#!/bin/sh

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

while true; do
    $DIR/bitcoin_price.sh
    $DIR/update_weather.sh
    # $DIR/check_battery.sh
    # $DIR/low_battery_suspend.sh
    $DIR/ping_blog.sh
    $DIR/battery.sh

	sleep 30s
done

