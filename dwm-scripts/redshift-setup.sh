#!/bin/sh

datafile="/tmp/redshift.dat"
redshift -m randr -P -O 6500
echo 6500 > $datafile
exit
