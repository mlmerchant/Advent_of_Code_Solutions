max = 0
sum = 0
while read; do
    # process last line for an elf
    if [[ -z $REPLY ]]; then
        if [[ $sum -gt $max ]]; then
            max=$sum
        fi
        sum=0
    fi
    sum=$((REPLY + sum))
done < puzzle.txt

echo $max
# Answer is 71924
