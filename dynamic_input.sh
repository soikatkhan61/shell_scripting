#! /bin/bash
arr=()
echo "Size of the array"
read size

for ((i=0 ; i< size; i++))
do
    echo "enter elements $(($i+1))"
    read input
    arr[i]=$input
done

echo ${arr[*]}