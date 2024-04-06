#!/opt/homebrew/bin/bash

declare -A lookup
    lookup[8]=7
    lookup[7]=6
    lookup[6]=5
    lookup[5]=4
    lookup[4]=3
    lookup[3]=2
    lookup[2]=1
    lookup[1]=0
    lookup[0]=6,8
    
    
function age() {
  while read; do
      echo ${lookup[$REPLY]} | tr , '\n'
  done 
}

# Terribly inefficient solution, but fun
echo "5,4,3,5,1,1,2,1,2,1,3,2,3,4,5,1,2,4,3,2,5,1,4,2,1,1,2,5,4,4,4,1,5,4,5,2,1,2,5,5,4,1,3,1,4,2,4,2,5,1,3,5,3,2,3,1,1,4,5,2,4,3,1,5,5,1,3,1,3,2,2,4,1,3,4,3,3,4,1,3,4,3,4,5,2,1,1,1,4,5,5,1,1,3,2,4,1,2,2,2,4,1,2,5,5,1,4,5,2,4,2,1,5,4,1,3,4,1,2,3,1,5,1,3,4,5,4,1,4,3,3,3,5,5,1,1,5,1,5,5,1,5,2,1,5,1,2,3,5,5,1,3,3,1,5,3,4,3,4,3,2,5,2,1,2,5,1,1,1,1,5,1,1,4,3,3,5,1,1,1,4,4,1,3,3,5,5,4,3,2,1,2,2,3,4,1,5,4,3,1,1,5,1,4,2,3,2,2,3,4,1,3,4,1,4,3,4,3,1,3,3,1,1,4,1,1,1,4,5,3,1,1,2,5,2,5,1,5,3,3,1,3,5,5,1,5,4,3,1,5,1,1,5,5,1,1,2,5,5,5,1,1,3,2,2,3,4,5,5,2,5,4,2,1,5,1,4,4,5,4,4,1,2,1,1,2,3,5,5,1,3,1,4,2,3,3,1,4,1,1"  | tr , '\n'  > 0
cat 0 | age | age | age | age | age | age | age | age | age | age > 1
cat 1 | age | age | age | age | age | age | age | age | age | age > 2
cat 2 | age | age | age | age | age | age | age | age | age | age > 3
cat 3 | age | age | age | age | age | age | age | age | age | age > 4
cat 4 | age | age | age | age | age | age | age | age | age | age > 5
cat 5 | age | age | age | age | age | age | age | age | age | age > 6
cat 6 | age | age | age | age | age | age | age | age | age | age > 7
cat 7 | age | age | age | age | age | age | age | age | age | age > 8
cat 8 | wc -l

# Answer is 350917
