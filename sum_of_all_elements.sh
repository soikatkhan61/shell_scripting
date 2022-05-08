#! /bin/bash
arr=(4 4 4 4 )
sum=0
for ((i=0; i<${#arr[@]};i++))
do 
    sum=$(($sum+${arr[i]}))
done

echo $sum