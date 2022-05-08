#! /bin/bash

p=()
bt=()
wt=()
tat=()

echo "Enter the number of process"
read n

for ((i = 0; i < n; i++)); do
    p[i]=$i
    echo "Enter Burst time for process P$i"
    read input
    bt[i]=$input
done

echo ${bt[*]}

for ((i = 0; i < n; i++)); do
    for ((k = $(($i + 1)); k < n; k++)); do
        if [ ${bt[i]} -gt ${bt[k]} ]; then

            temp=${bt[i]}
            bt[i]=${bt[k]}
            bt[k]=$temp

            temp=${p[i]}
            p[i]=${p[k]}
            p[k]=$temp
        fi
    done

done

wt[0]=0
wtavg=0

tat[0]=${bt[0]}
tatavg=${bt[0]}

for ((i = 1; i < n; i++)); do
    wt[i]=${tat[$(($i - 1))]}
    tat[i]=$((${wt[i]} + ${bt[i]}))
    wtavg=$(($wtavg + ${wt[i]}))
    tatavg=$(($tatavg + ${tat[i]}))
done

echo -e "\n\t Process \tBurst Time \t Waiting Time \tTurnaround Time\n"

for ((i = 0; i < n; i++)); do
    echo -e "\n\t P${p[i]} \t\t ${bt[i]} \t\t ${wt[i]} \t\t ${tat[i]} "
done

echo -e "\n\n"
echo "Average Waiting time --> $(($wtavg / $n))"
echo -e "\n"

echo -e "\n\n"
echo "Average Turnaround time --> $(($tatavg / $n))"
echo -e "\n"
