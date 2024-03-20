#!/bin/bash

last=$(cat challenge.txt | head -n 1)

count=0

while read; do
  if [[ $REPLY -gt $last ]]; then
    ((count++))
  fi
  last=$REPLY
done < challenge.txt

echo $count
# 1722