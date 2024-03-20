#!/bin/env bash

chal="R1, R1, R3, R1, R1, L2, R5, L2, R5, R1, R4, L2, R3, L3, R4, L5, R4, R4, R1, L5, L4, R5, R3, L1, R4, R3, L2, L1, R3, L4, R3, L2, R5, R190, R3, R5, L5, L1, R54, L3, L4, L1, R4, R1, R3, L1, L1, R2, L2, R2, R5, L3, R4, R76, L3, R4, R191, R5, R5, L5, L4, L5, L3, R1, R3, R2, L2, L2, L4, L5, L4, R5, R4, R4, R2, R3, R4, L3, L2, R5, R3, L2, L1, R2, L3, R2, L1, L1, R1, L3, R5, L5, L1, L2, R5, R3, L3, R3, R5, R2, R5, R5, L5, L5, R2, L3, L5, L2, L1, R2, R2, L2, R2, L3, L2, R3, L5, R4, L4, L5, R3, L4, R1, R3, R2, R4, L2, L3, R2, L5, R5, R4, L2, R4, L1, L3, L1, L3, R1, R2, R1, L5, R5, R3, L3, L3, L2, R4, R2, L5, L1, L1, L5, L4, L1, L1, R1"
chal=$(echo "$chal" | sed 's/, /\\n/g')

x=0
y=0

heading='N'

function turn() {
    if [[ $heading == "N" ]]; then
        if [[ $1 == "L" ]]; then
            heading="W"
        else
            heading="E"
        fi
    elif [[ $heading == "E" ]]; then
        if [[ $1 == "L" ]]; then
            heading="N"
        else
            heading="S"
        fi
    elif [[ $heading == "S" ]]; then
        if [[ $1 == "L" ]]; then
            heading="E"
        else
            heading="W"
        fi
    else
        if [[ $1 == "L" ]]; then
            heading="S"
        else
            heading="N"
       fi 
   fi
}

function travel() {
    distance=$1
    for ((z=0; z < distance; z++)); do
        if [[ $heading == "N" ]]; then
            ((y++))
        elif [[ $heading == "E" ]]; then
            ((x++))
        elif [[ $heading == "S" ]]; then
            ((y--))
        else # West
            ((x--))
        fi
    done
}

while read line; do
    turn ${line:0:1}
    travel ${line:1:3}
done < <(echo -e $chal)

# 241 is the Answer
echo x: $x y: $y

