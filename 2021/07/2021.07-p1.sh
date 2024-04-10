#!/bin/bash

input=challenge.txt

# Get the most common number
target=$(cat $input | sort -n | uniq -c | sort -n -k 1 | tail -n 1 | cut -d ' ' -f 8)

echo Target is $target.

#absolute value function
. ../../Tools/abs.sh


total=0

while read; do
  position=$REPLY
  echo "$position is the position"
  moves=$(( target - position ))
  echo "which is this distance from target: $moves"
  moves=$(abs $moves)
  echo "Which is this positive number: $moves"
  total=$(( total + moves ))
  echo "And here is the total: $total"
done < $input

echo $total

# 398784 is too high
# 398697 is too high
