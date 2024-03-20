#!/bin/bash

###############################
# Take first and last number on each
# line, concat them together, and 
# add them up.

sum=0

while read -r line; do
    # Extract the first number
    temp=${line#*[0-9]}
    temp2=${line%$temp}
    i=${#temp2}
    i=$(( i - 1 ))
    num1=${temp2:$i:1}

    # Extract the last number
    temp=${line%[0-9]*}
    temp2=${line#$temp}
    num2=${temp2:0:1}

    # Concat the numbers
    number="$num1$num2"
    
    # Add numbers up
    sum=$(( sum + number ))
done < input.txt

echo $sum
