#!/bib/bash
## String -> Chars
## Takes a string, and splits into one char per line

var=$1

while read; do
    echo $REPLY
done <  <(sed '$d' <(echo $var  | sed 's/./&\n/g'))
