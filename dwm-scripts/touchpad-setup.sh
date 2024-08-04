#!/bin/sh

# 启用触控板
id=`xinput list | grep "Touchpad" | cut -d'=' -f2 | cut -d'[' -f1`

# 設置鼠標移動速度
action_id=`xinput list-props $id | grep "Accel Speed (" \
                      | cut -d'(' -f2 | cut -d')' -f1`

xinput --set-prop $id $action_id 0.6

