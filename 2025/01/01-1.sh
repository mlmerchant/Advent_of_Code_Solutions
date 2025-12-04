#!/bin/bash

needle=50
zeros=0 

while IFS= read -r line; do
  direction="${line:0:1}"
  turns=${line:1}
  if [ $direction == "L" ]; then
      turns=$((turns * -1))
  fi
  needle=$((needle + turns))
  needle_check=$((needle % 100))
  if [ $needle_check -eq 0 ]; then
      ((zeros++))
  fi
done < puzzle_01.txt


echo $zeros

#Answer is 1054
