#!/bin/sh

value=6000
datafile="/tmp/redshift.dat"

if [ -f $datafile ]; then
    value=$(cat $datafile)
    value=$(( value ))
fi

if [ $value -lt 1000 ]; then
    value=1000
fi

value=$(( value + 500 ))
redshift -m randr -P -O $value
echo $value > $datafile

exit
