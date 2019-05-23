#!/bin/bash

tt="TT"
px="PX" 
input='sample2-candidate-data.csv'
[ -e PX_hosts.txt ] && rm PX_hosts.txt
[ -e TT_hosts.txt ] && rm TT_hosts.txt
while IFS=, read -r c1 c2 c3 c4 c5
do
if [[ "$c3" == "$tt" ]]; then
echo "$c5" | awk -F"," '{print $2}' >> TT_hosts.txt
elif [[ "$c3" == "$px" ]]; then
echo "$c5" | awk -F"," '{print $2}' >> PX_hosts.txt
fi	
done < $input
