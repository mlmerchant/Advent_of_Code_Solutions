#!/bin/bash

# Get the most common number
target=$(cat challenge.txt | sort -n | uniq -c | sort -n -k 1 | tail -n 1 | cut -d ' ' -f 8)


