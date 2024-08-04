#!/bin/sh

function update_weather() {
    weather=""
    cnt=0
    KEY="SKrS41e55-hIegqmx"
    LOCATION="zhuhai"
    URL="https://api.seniverse.com/v3/weather/now.json?key=$KEY&location=$LOCATION"

    while [[ $weather == "" ]]; do
        weather=$(timeout 60 curl -s $URL)
        weather=$(echo -e $weather | jq '.results' | jq '.[0]' | jq '.now.temperature' | sed 's/\"//g')

        cnt=$((cnt + 1))
        if [ $cnt -eq 5 ]; then
            exit
        fi

        sleep 1
    done

    weather=$(printf " %s℃ "  $weather)
    echo $weather > "/tmp/weather.dat"
}

update_weather
exit
