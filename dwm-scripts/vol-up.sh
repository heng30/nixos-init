!/bin/sh

 vol=$(amixer get Master)
 is_master=$(echo $vol | grep "Master")

 if [ "$is_master" == "" ]; then
     amixer -qM set Speaker 5%+
 else
     amixer -qM set Master 5%+
 fi

