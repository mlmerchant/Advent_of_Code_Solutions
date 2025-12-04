#!/bin/bash

needle=50
zeros=0 

while IFS= read -r line; do
  direction="${line:0:1}"
  turns=${line:1}
  move=1
  if [ $direction == "L" ]; then
      move=$((move * -1))
  fi

  for ((i=1; i<=$turns; i++)); do
      needle=$((needle + move))
      needle_check=$((needle % 100))
      if [ $needle_check -eq 0 ]; then
          ((zeros++))
      fi
 done

done < puzzle_01.txt


echo $zeros

# Answer is 6295
