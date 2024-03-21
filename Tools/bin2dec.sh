#!/bin/bash

dec=$1

i=${#dec}
currentPower=1  #  1, 2, 4, 8, 16 etc
result=0

  for ((i-- ; i > -1; i--)); do  #  Starting at far right, value of 1
      currentNumber=${dec:$i:1}
      result=$(( (currentPower * currentNumber) + result ))
      currentPower=$(( currentPower * 2 ))
  done
  echo $result
