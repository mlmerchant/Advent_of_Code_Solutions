#!/bin/bash

# The start of an idea
echo 12809023 | grep -o . | awk '{a[NR]=$0} END {
    asort(a, s, "@val_num_desc")
    for (i=1;i<=2;i++) top[s[i]]=1
    for (i=1;i<=NR;i++) if (top[a[i]]) printf a[i]
    print ""
}'
