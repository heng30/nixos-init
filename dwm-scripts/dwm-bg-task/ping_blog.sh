#!/bin/sh

ret=`curl https://heng30.xyz/ping`

if [ "$ret" == "pong" ]; then
    echo "O" > "/tmp/ping_blog.dat"
else
    echo "E" > "/tmp/ping_blog.dat"
fi;
