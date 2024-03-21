#!/bin/bash

depth=0
forward=0
aim=0

# down X increases your aim by X units.
# up X decreases your aim by X units.
# forward X does two things:
# It increases your horizontal position by X units.
# It increases your depth by your aim multiplied by X.

while read; do
    command=$(echo $REPLY | cut -d ' ' -f 1)
    increment=$(echo $REPLY | cut -d ' ' -f 2)
    if [[ $command == "up" ]]; then
        aim=$((aim - increment))
    elif [[ $command == "down" ]]; then
        aim=$((aim + increment))
    elif [[ $command == "forward" ]]; then
        forward=$((forward + increment))
        depth=$((depth + increment * aim))
    else
        echo "Unexpected Input"
        exit 1
    fi
done < challenge.txt

echo $((depth * forward))

too high
# 1408487760
