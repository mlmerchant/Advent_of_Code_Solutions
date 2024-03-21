#!/bin/bash

function sum_col() {
  # int file -> int
  # provides the sum of a column of digits
  col=$1
  chal=$2
  while read; do
    echo $REPLY | cut -c $col
  done < $chal  | ../../Tools/sum_int.sh
}


declare -A totals
declare -A gammas
declare -A epsils

# O(n) solution.  Not great, but small data set.
i=1
for col in $(seq 12 -1 1); do
  totals[$i]=$(sum_col $col challenge.txt)
  if [[ ${totals[$i]} -ge 500  ]]; then
    gammas[$i]=1
    epsils[$i]=0
  else
    gammas[$i]=0
    epsils[$i]=1
  fi
  ((i++))
done

# get gammas in bin
g=$(for i in $(seq 12); do
  echo -n ${gammas[$i]}
done
echo)

# get epsils in bin
e=$(for i in $(seq 12); do
  echo -n ${epsils[$i]}
done
echo)

# bin to dec
g=$(../../Tools/bin2dec.sh $g)
e=$(../../Tools/bin2dec.sh $e)

echo $((g * e))

# 3528846 is too low