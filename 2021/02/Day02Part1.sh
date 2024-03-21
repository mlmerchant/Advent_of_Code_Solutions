#!/bin/bash

depth=0
forward=0

while read; do
    command=$(echo $REPLY | cut -d ' ' -f 1)
    increment=$(echo $REPLY | cut -d ' ' -f 2)
    if [[ $command == "up" ]]; then
        depth=$((depth - increment))
    elif [[ $command == "down" ]]; then
        depth=$((depth + increment))
    elif [[ $command == "forward" ]]; then
        forward=$((forward + increment))
    else
        echo "Unexpected Input"
        exit 1
    fi
done < challenge.txt

echo $((depth * forward))

# 1690020
