#! /bin/bash

arr1=(2 3 4 5 6 7)
arr2=()

for ((i=0;i<${#arr1[@]};i++))
do
    arr2[i]=${arr1[i]}
done
echo "copied"
echo "${arr2[*]}"