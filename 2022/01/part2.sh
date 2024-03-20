sum=0
while read; do
    # process last line for an elf
    if [[ -z $REPLY ]]; then
        echo $sum
        sum=0
    fi
    sum=$((REPLY + sum))
done < puzzle.txt | sort -n | tail -n 3 | awk '{ sum += $1 } END { print sum }'

# The correct answer is 210406