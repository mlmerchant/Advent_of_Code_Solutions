low=$(head -n 1 challenge.txt)
high=$(tail -n 1 challenge.txt)

count=0

for i in $(seq $low $high); do
    # skip numbers without matching pairs
    (echo $i| grep -E '([0-9])\1' > /dev/null) || continue

    # ensure numbers are greater from left to right
    [[  ${i:0:1} -le ${i:1:1} ]] &&
    [[  ${i:1:1} -le ${i:2:1} ]] &&
    [[  ${i:2:1} -le ${i:3:1} ]] &&
    [[  ${i:3:1} -le ${i:4:1} ]] &&
    [[  ${i:4:1} -le ${i:5:1} ]] || continue

    # If it passes those checks, increment the counter
    (( count++ ))
    echo $count

done

echo $count
