#!/bin/sh

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

. "$DIR/dwm_bluetooth.sh"
. "$DIR/dwm_battery.sh"
. "$DIR/dwm_backlight.sh"
. "$DIR/dwm_alsa.sh"
. "$DIR/dwm_net_statistics.sh"
. "$DIR/dwm_date.sh"
. "$DIR/dwm_net_type.sh"
. "$DIR/dwm_sysinfo.sh"
. "$DIR/dwm_weather.sh"
. "$DIR/dwm_uptime.sh"
. "$DIR/dwm_redshift.sh"
. "$DIR/dwm_ping_blog.sh"
. "$DIR/dwm_crypto_info.sh"
. "$DIR/dwm_obs_running.sh"
. "$DIR/dwm_bluetooth_keyboard_connected.sh"
. "$DIR/dwm_simdict_running.sh"
. "$DIR/dwm_cryptoinfo_running.sh"
. "$DIR/dwm_blender_running.sh"
. "$DIR/dwm_fcitx5_running.sh"
. "$DIR/dwm_musicbox_running.sh"

xsetroot -name "$(dwm_ping_blog)$(dwm_musicbox_running)$(dwm_blender_running)$(dwm_obs_running)$(dwm_simdict_running)$(dwm_cryptoinfo_running)$(dwm_bluetooth)$(dwm_fcitx5_running)$(dwm_bluetooth_keyboard_connected)|$(dwm_net_type)$(dwm_net_statistics)|$(dwm_sysinfo)|$(dwm_backlight) $(dwm_redshift)|$(dwm_alsa)|$(dwm_battery)|$(dwm_crypto_info)|$(dwm_uptime)|$(dwm_weather)|$(dwm_date)"

