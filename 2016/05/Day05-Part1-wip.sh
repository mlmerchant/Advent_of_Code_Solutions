inc=0

while true; do
    counter=0
    catch=$(echo "reyedfim$counter" | md5sum)
    if [[ ${catch:0:5} == "00000" ]]; then
        temp=${catch%%[123456789ABCDEF]*}
        catch=${catch#$temp}
        echo ${catch:0:1}
        ((inc++))
        if [[ $inc -eq 8 ]]; then
            exit 0
        fi
    fi
    ((counter++))
done
