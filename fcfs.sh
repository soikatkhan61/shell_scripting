#! /bin/bash

p=()
bt=()
wt=()
tat=()

echo "enter the number of proccess"
read n
echo -e "\n"

for ((i=0;i<n;i++))
do
    echo "Enter the Burst time: $i"
    read input
    bt[i]=$input
done



wt[0]=0
tat[0]=${bt[0]}
wtavg=0
tatavg=${bt[0]}

for ((i=1;i<n;i++))
do
    wt[i]=${tat[$(($i-1))]}
    tat[i]=$((${bt[i]} + ${wt[i]} ))
    wtavg=$(($wtavg + ${wt[i]}))
    tatavg=$(($tatavg + ${tat[i]}))

done

echo -e "\nProccess\tBurst Time\tWaiting Time\tTurnaround Time"
for ((i=0;i<n;i++)){
    echo -e "\nP$i \t\t ${bt[i]} \t\t ${wt[i]} \t\t ${tat[i]}"
}

echo -e "\n\n"

echo "Average waiting time --> $(($wtavg/$n))"
echo -e "\n"
echo "Average Turnaround time --> $(($tatavg/$n)) "