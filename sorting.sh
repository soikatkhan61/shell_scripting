function bubble(){
#buuble sort
for ((i=0; i<6; i++))
do
    for ((j=0;j<6-i-1;j++))
    do
        if [ ${arr[j]} -gt ${arr[j+1]} ]
        then
            #swap
            temp=${arr[j]}
            arr[$j]=${arr[$((j+1))]}
            arr[$((j+1))]=$temp
        fi
    done
done
}

arr=( 10 8 20 100 12 2 )

echo -e "\nOriginal Order of this array"
echo ${arr[*]}

bubble 

echo "Sorted array is:"
echo ${arr[*]}