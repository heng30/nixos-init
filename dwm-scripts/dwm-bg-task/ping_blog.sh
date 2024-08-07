#!/bin/sh

ret=`curl https://heng30.xyz/ping`

if [ "$ret" == "pong" ]; then
    echo "  " > "/tmp/ping_blog.dat"
else
    echo "" > "/tmp/ping_blog.dat"
fi;
