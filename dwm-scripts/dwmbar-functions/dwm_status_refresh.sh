#!/bin/sh

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

while true; do
    $DIR/dwm_status.sh
    sleep 1
done
