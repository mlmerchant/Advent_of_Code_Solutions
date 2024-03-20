#!/bin/bash

cat << EOF > chal
rect 1x1
rotate row y=0 by 2
rect 1x1
rotate row y=0 by 5
rect 1x1
rotate row y=0 by 3
rect 1x1
rotate row y=0 by 3
rect 2x1
rotate row y=0 by 5
rect 1x1
rotate row y=0 by 5
rect 4x1
rotate row y=0 by 2
rect 1x1
rotate row y=0 by 2
rect 1x1
rotate row y=0 by 5
rect 4x1
rotate row y=0 by 3
rect 2x1
rotate row y=0 by 5
rect 4x1
rotate row y=0 by 2
rect 1x2
rotate row y=1 by 6
rotate row y=0 by 2
rect 1x2
rotate column x=32 by 1
rotate column x=23 by 1
rotate column x=13 by 1
rotate row y=0 by 6
rotate column x=0 by 1
rect 5x1
rotate row y=0 by 2
rotate column x=30 by 1
rotate row y=1 by 20
rotate row y=0 by 18
rotate column x=13 by 1
rotate column x=10 by 1
rotate column x=7 by 1
rotate column x=2 by 1
rotate column x=0 by 1
rect 17x1
rotate column x=16 by 3
rotate row y=3 by 7
rotate row y=0 by 5
rotate column x=2 by 1
rotate column x=0 by 1
rect 4x1
rotate column x=28 by 1
rotate row y=1 by 24
rotate row y=0 by 21
rotate column x=19 by 1
rotate column x=17 by 1
rotate column x=16 by 1
rotate column x=14 by 1
rotate column x=12 by 2
rotate column x=11 by 1
rotate column x=9 by 1
rotate column x=8 by 1
rotate column x=7 by 1
rotate column x=6 by 1
rotate column x=4 by 1
rotate column x=2 by 1
rotate column x=0 by 1
rect 20x1
rotate column x=47 by 1
rotate column x=40 by 2
rotate column x=35 by 2
rotate column x=30 by 2
rotate column x=10 by 3
rotate column x=5 by 3
rotate row y=4 by 20
rotate row y=3 by 10
rotate row y=2 by 20
rotate row y=1 by 16
rotate row y=0 by 9
rotate column x=7 by 2
rotate column x=5 by 2
rotate column x=3 by 2
rotate column x=0 by 2
rect 9x2
rotate column x=22 by 2
rotate row y=3 by 40
rotate row y=1 by 20
rotate row y=0 by 20
rotate column x=18 by 1
rotate column x=17 by 2
rotate column x=16 by 1
rotate column x=15 by 2
rotate column x=13 by 1
rotate column x=12 by 1
rotate column x=11 by 1
rotate column x=10 by 1
rotate column x=8 by 3
rotate column x=7 by 1
rotate column x=6 by 1
rotate column x=5 by 1
rotate column x=3 by 1
rotate column x=2 by 1
rotate column x=1 by 1
rotate column x=0 by 1
rect 19x1
rotate column x=44 by 2
rotate column x=40 by 3
rotate column x=29 by 1
rotate column x=27 by 2
rotate column x=25 by 5
rotate column x=24 by 2
rotate column x=22 by 2
rotate column x=20 by 5
rotate column x=14 by 3
rotate column x=12 by 2
rotate column x=10 by 4
rotate column x=9 by 3
rotate column x=7 by 3
rotate column x=3 by 5
rotate column x=2 by 2
rotate row y=5 by 10
rotate row y=4 by 8
rotate row y=3 by 8
rotate row y=2 by 48
rotate row y=1 by 47
rotate row y=0 by 40
rotate column x=47 by 5
rotate column x=46 by 5
rotate column x=45 by 4
rotate column x=43 by 2
rotate column x=42 by 3
rotate column x=41 by 2
rotate column x=38 by 5
rotate column x=37 by 5
rotate column x=36 by 5
rotate column x=33 by 1
rotate column x=28 by 1
rotate column x=27 by 5
rotate column x=26 by 5
rotate column x=25 by 1
rotate column x=23 by 5
rotate column x=22 by 1
rotate column x=21 by 2
rotate column x=18 by 1
rotate column x=17 by 3
rotate column x=12 by 2
rotate column x=11 by 2
rotate column x=7 by 5
rotate column x=6 by 5
rotate column x=5 by 4
rotate column x=3 by 5
rotate column x=2 by 5
rotate column x=1 by 3
rotate column x=0 by 4
EOF

### Assume a 50 x 6 grid with 0,0 at top left


function rotate_row() {
    # rotate right
    local y=$1
    local temp=${grid["49.$y"]}
    local x
    for ((x=49; x > 0; x--)); do
        grid["$x.$y"]=${grid["$((x - 1)).$y"]}
    done 
    grid["0.$y"]=$temp
}

function rotate_column() {
    # rotate down
    local x=$1
    local temp=${grid["$x.5"]}
    grid["$x.5"]=${grid["$x.4"]}
    grid["$x.4"]=${grid["$x.3"]}
    grid["$x.3"]=${grid["$x.2"]}
    grid["$x.2"]=${grid["$x.1"]}
    grid["$x.1"]=${grid["$x.0"]}
    grid["$x.0"]=$temp
}


# 50 x 6 grid
declare -A grid

while read -r line; do #row
    if [[ ${line:7:1 } == "r" ]]; then
        temp=$(echo $line | cut -d '=' -f 2)
        y=$(echo $temp | cut -d ' ' -f 1)
        by=$(echo $temp | cut -d ' ' -f 3)
        for i in $(seq $by); do
            rotate_row $y
        done 
    elif [[ ${line:7:1 } == "c" ]]; then #col
        temp=$(echo $line | cut -d '=' -f 2)
        x=$(echo $temp | cut -d ' ' -f 1)
        by=$(echo $temp | cut -d ' ' -f 3)
        for i in $(seq $by); do
            rotate_column $x
        done 
    else # rect
        temp=$(echo $line | cut -d ' ' -f 2)
        x=$(echo $temp | cut -d 'x' -f 1)
        y=$(echo $temp | cut -d 'x' -f 2)
        for (( xi=0; xi < x ; xi++)); do
            for (( yi=0; yi < y ; yi++)); do
                grid["$xi.$yi"]="#"
            done 
        done 
    fi
done < chal

total=0
for item in ${grid[@]}; do
    if [[ $item == '#' ]]; then
        ((total++))
    fi
done


for ((y=0; y < 6; y++)); do
    for ((x=0; x < 50; x++)) do
        echo -n "${grid["$x.$y"]:-_}"
    done
    echo
done > output.txt

cat output.txt

# the answer is zjhrkcplyj
