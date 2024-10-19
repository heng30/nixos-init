#!/bin/sh

paths=("$HOME/Documents/blender-daily-practice")

for path in "${paths[@]}"; do
    cd $path
    git add . && git commit -m "[*]routinely update"
    git push
done

