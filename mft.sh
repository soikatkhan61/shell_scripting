#! /bin/bash

mp=()
p=0
tif=0

echo "Enter the total memory available (in bytes): "
read ms

echo "Enter the block size"
read bs 

nob=$(($ms/$bs))
ef=$(($ms - $(( $nob*$bs )) ))

echo -e "\nEnter the number of proccess"
read n

for ((i=0;i<n;i++))
do
    echo "Enter memory required for proccess $(($i+1))"
    read mp[i]
done

echo -e "\nNo of blocks available in memory -- $nob"
echo -e "\n\nProcess\tMemory Required\tAllocated\tInternal Fragmentation"

for ((i=0;i<n && p<nob;i++))
do
    echo -e "$(($i+1))\t\t${mp[i]}"

    if [ ${mp[i]} -gt $bs ]
    then 
        echo -e "\t\t No \t\t--"
    else
        echo -e "\t\t YES \t\t$(($bs-${mp[i]}))"
        tif=$(($tif+$(($bs-${mp[i]}))))
        p=$p+1
    fi
done 

if [ $i -lt $n ]
then 
    echo -e "\n\nMemory is full"
fi

echo -e "\n\nTotal internal Fragmentation $tif"
echo -e "\n\nTotal extental Fragmentation $ef"
