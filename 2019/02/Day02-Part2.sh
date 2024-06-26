#!/bin/bash

cat << EOF > chal
1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,6,1,19,1,19,10,23,2,13,23,27,1,5,27,31,2,6,31,35,1,6,35,39,2,39,9,43,1,5,43,47,1,13,47,51,1,10,51,55,2,55,10,59,2,10,59,63,1,9,63,67,2,67,13,71,1,71,6,75,2,6,75,79,1,5,79,83,2,83,9,87,1,6,87,91,2,91,6,95,1,95,6,99,2,99,13,103,1,6,103,107,1,2,107,111,1,111,9,0,99,2,14,0,0
EOF

# echo "1,1,1,4,99,5,6,0,99" > chal

function try_numbers() {
    mapfile -t array < <(tr ',' '\n' < chal)

    array[1]=$1
    array[2]=$2

    i=0
    while true; do
        opcode=${array[$i]}
        if [[ $opcode -eq 1 ]]; then
            array[${array[i + 3]}]=$((${array[${array[i + 2]}]} + ${array[${array[i + 1]}]}))
        elif [[ $opcode -eq 2 ]]; then
            array[${array[i + 3]}]=$((${array[${array[i + 2]}]} * ${array[${array[i + 1]}]}))
        elif [[ $opcode -eq 99 ]]; then
            break
        fi
        i=$((i + 4))
    done

    echo ${array[0]}
}


for i in {0..99}; do
    for j in {0..99}; do
        if [[ 19690720 -eq $(try_numbers $i $j) ]]; then
            answer=$((100 * i + j))
            echo $answer
            exit
        fi
    done
done

# 6635 is the answer
