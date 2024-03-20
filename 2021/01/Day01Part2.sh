#!/bin/bash

last=$(cat challenge.txt | head -n 1)

count=0
line=0

while read; do
  C=$B
  B=$A
  A=$REPLY
  current_total=$((A + B + C))
  if [[ $current_total -gt $last_total ]] && [[ $line -ge 4 ]]; then
    ((count++))
  fi
  last_total=$current_total
  ((line++))

done < challenge.txt

echo $count
# 1748