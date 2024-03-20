#!/bin/bash

INPUT_DATA="./input.txt"

total_score=0

while read -r line; do
    line=${line##*:}
    card_points=0
    winning_numbers=( $(echo $line | cut -d'|' -f1) )
    card_numbers=( $(echo $line | cut -d'|' -f2) )
    for winning_number in "${winning_numbers[@]}"; do
        for card_number in "${card_numbers[@]}"; do
            if [ "$winning_number" == "$card_number" ]; then
                if [ "$card_points" == "0" ]; then
                    card_points=1
                else
                    card_points=$(( card_points * 2 ))
                fi
            fi
        done
    done
    total_score=$(( total_score + card_points ))

done < $INPUT_DATA

# Test input total is 13
# Challenge input total is 26443
echo $total_score