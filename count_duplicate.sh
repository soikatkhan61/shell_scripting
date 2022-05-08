#! /bin/bash
echo "enter size of the array: "
read size

for ((i=0; i< size; i++))
do
    echo "enter elements for $i"
    read input
    arr[i]=$input
done

for ((i = 0; i < ${#arr[@]}; i++)); do
    arr2[i]=${arr[i]}
    arr3[i]=0
done
echo ${arr2[*]}
echo ${arr3[*]}


total_dup=0
mm=1
for ((i = 0; i < ${#arr[@]}; i++)); do
    for ((j = 0; j < ${#arr2[@]}; j++)); do
        if [ "${arr[i]}"  -eq "${arr2[j]}" ]
        then    
            arr3[j]=$mm
            mm=$(($mm + 1 ))
        fi
    done
    mm=1
done

echo ${arr3[*]}

for ((i = 0; i < ${#arr3[@]}; i++)); do
    if [ ${arr3[i]} == 2 ]
    then
        total_dup=$(($total_dup+1))
    fi
done

echo $total_dup
