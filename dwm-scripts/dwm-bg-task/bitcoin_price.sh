#!/bin/sh

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

price=$(timeout 60 $DIR/bitcoin_price.py)
echo $price
if [ "$price" != "" ]; then
    echo "BTC $price" > /tmp/bitcoin_price.dat
fi
