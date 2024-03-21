#!/bin/bash

#  int
#  int
#  int -> int
#  Expects list of ints to be piped in via stdin.

shopt -s extglob

total=0

while read; do
  if [[ -z "${REPLY//*([[:digit:]])}" ]]; then
    total=$((total + REPLY))
  fi
done

echo $total