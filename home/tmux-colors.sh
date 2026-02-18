#!/bin/bash

for i in {0..255}; do
    if [ $i -lt 16 ]; then
        # Approximerade standardfärger
        r=(0 128 0 128 0 128 128 192 128 255 0 255 0 255 255 255)
        g=(0 0 128 128 128 128 0 192 128 255 0 255 0 255 255 255)
        b=(0 0 0 0 128 128 128 192 255 255 255 255 255 255 255 255)
        hex=$(printf "#%02X%02X%02X" ${r[i]} ${g[i]} ${b[i]})
    elif [ $i -ge 16 ] && [ $i -le 231 ]; then
        c=$((i-16))
        r=$(( (c/36)%6*51 ))
        g=$(( (c/6)%6*51 ))
        b=$(( (c%6)*51 ))
        hex=$(printf "#%02X%02X%02X" $r $g $b)
    else
        gray=$((8 + (i-232)*10))
        hex=$(printf "#%02X%02X%02X" $gray $gray $gray)
    fi
    printf "\x1b[38;5;${i}mcolor%3d - ██████████ %s\n" $i $hex
done
