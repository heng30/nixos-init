#!/bin/sh

value=7000
datafile="/tmp/redshift.dat"

if [ -f $datafile ]; then
    value=$(cat $datafile)
    value=$(( value ))
fi

if [ $value -lt 1000 ]; then
    value=1000
else
    value=$(( value - 500 ))
fi

redshift -m randr -P -O $value
echo $value > $datafile

exit
