#!/bin/bash

input='sample2-candidate-data.csv'
while IFS=, read -r c1 c2 c3 c4 c5
do
    echo "$c5" | awk -F"," '{print $2}' | awk -F"." '{print $1}'
done < $input



