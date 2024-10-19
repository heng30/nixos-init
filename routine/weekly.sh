#!/bin/sh

paths=("$HOME/Documents/private" "$HOME/Documents/backup")

for path in "${paths[@]}"; do
    cd $path
    git add . && git commit -m "[*]routinely update"
    git push
done
