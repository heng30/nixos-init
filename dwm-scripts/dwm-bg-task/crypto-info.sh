#!/bin/sh

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

info=$(timeout 60 $DIR/crypto-info.py)
echo $info
if [ "$info" != "" ]; then
    echo "$info" > /tmp/crypto-info.dat
fi
