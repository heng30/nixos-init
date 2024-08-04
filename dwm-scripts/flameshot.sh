#!/bin/sh

pidof flameshot | xargs kill -9
flameshot gui
sleep $((30*60)) # 30分钟的编辑时间

