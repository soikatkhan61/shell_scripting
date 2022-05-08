#! /bin/bash
memoryIndex=0
pageFaultCount=0
pages=()
memory=()

echo -n "Enter the number of pages: "
read numberOfPages

echo "Enter the pages: "
for ((i=0;i<numberOfPages;i++))
do
    read pages[i]
done

read -p "Enter the number of frames" noOfFrames
echo $noOfFrames

for ((i=0;i<noOfFrames;i++))
do
    memory[i]=-1
done

echo "The page replacement proccess is -->"

for ((i=0; i<numberOfPages;i++))
do
    for ((j=0;j<noOfFrames;j++))
    do 
        if [ "${memory[j]}" == "${pages[i]}" ]
        then
            break
        fi
    done

    if [ $j == "$noOfFrames" ]
    then 
        memory[$memoryIndex]=${pages[i]}
        memoryIndex=$((memoryIndex+1))
        pageFaultCount=$((pageFaultCount+1))
    fi

    #print memory condition
    for ((k=0;k<noOfFrames;k++))
    do
        echo -e "\t${memory[k]}"
    done



    if [ $j == "$noOfFrames" ]
    then 
        echo -e "\tPage Fault No: $pageFaultCount"
    fi

    if [ $memoryIndex == "$noOfFrames" ]
    then
        memoryIndex=0
    fi
done

echo "The number of page fault using fifo is $pageFaultCount"