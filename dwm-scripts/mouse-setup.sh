#!/bin/sh

# Get id of touchpad and the id of the field corresponding to tapping to click
id=`xinput list | grep "Rapoo" | cut -d'=' -f2 | cut -d'[' -f1`

left_handed_enable=`xinput list-props $id | grep "Left Handed Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`

left_handed_enable_default=`xinput list-props $id | grep "Left Handed Enabled Default (" \
                      | cut -d'(' -f2 | cut -d')' -f1`

action_id=`xinput list-props $id | grep "Accel Speed (" \
                      | cut -d'(' -f2 | cut -d')' -f1`

# 設置鼠標移動速度
xinput --set-prop $id $action_id 0.6

# 启用鼠标左手
xinput --set-prop $id $left_handed_enable 1
