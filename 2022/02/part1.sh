#!/bin/bash

score=0

while read; do
    opponent=${REPLY:0:1}
    player=${REPLY:2:1}
    if [[ $player == "X" ]]; then
        if [[ $opponent == "C" ]]; then
            score=$((score + 6))
        elif [[ $opponent == "A" ]]; then
            score=$((score + 3))
        fi
        score=$((score + 1))
    elif [[ $player == "Y" ]]; then
        if [[ $opponent == "A" ]]; then
            score=$((score + 6))
        elif [[ $opponent == "B" ]]; then
            score=$((score + 3))
        fi
        score=$((score + 2))
   elif [[ $player == "Z" ]]; then
        if [[ $opponent == "B" ]]; then
            score=$((score + 6))
        elif [[ $opponent == "C" ]]; then
            score=$((score + 3))
        fi
        score=$((score + 3))
   fi
done < puzzle.txt

echo $score
# 15691 is the answer.
