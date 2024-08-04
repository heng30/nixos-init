#!/bin/sh

function dwm_redshift() {
    datafile="/tmp/redshift.dat"
    data=$(cat $datafile)
    echo "${data}K"
}
