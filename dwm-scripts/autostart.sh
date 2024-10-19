#!/bin/sh

# 状态栏显示设置
/bin/sh ~/.dwm/dwmbar-functions/dwm_status_refresh.sh &

# 背景图片设置
/bin/sh ~/.dwm/change_wallpaper.sh &

# 后台定时任务
/bin/sh ~/.dwm/dwm-bg-task/dwm_bg_timer.sh &

# 键盘启动设置
/bin/sh ~/.dwm/keyboard-setup.sh &

# 开启触摸板点击功能
/bin/sh ~/.dwm/touchpad-setup.sh &

# 鼠标设置
/bin/sh ~/.dwm/mouse-setup.sh &

# 开启shadowsock
/bin/sh ~/.dwm/v2ray.sh &

# 设置屏幕色温
/bin/sh ~/.dwm/redshift-setup.sh &

# start fcitx, 支持中文输入法的框架
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
fcitx5 &

# 获取窗口名称, 用于设置imwhell
# xprop WM_CLASS | grep -o '"[^"]*"' | head -n 1

# 设置鼠标, 不阻塞前后按键
imwheel -b 45 &

# 加载透明背景控件
picom &

xrandr --auto --dpi 150 &

# Disables Energy Start features
xset -dpms &

# Disables screen saver
xset s off &

# 启动st
st &
