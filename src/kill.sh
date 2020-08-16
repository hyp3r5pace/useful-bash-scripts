#!/bin/bash

echo "------------------------------- KILL A PROCESS ------------------------------------"

while true
do
    echo "Press Ctrl-C to quit"
    read -p "Enter the process name(s): " process_name
    if [ $process_name == "init0" ] || [ $process_name == "init1" ]
    then
        echo "Can't terminate init process"
    else
        pid=$(ps -e | grep "$process_name" | awk '{print $1}')
        tmp=$(echo $pid | awk '{print $2}')
        if [ $tmp == " " ] ## getting some error for single pid return and not working properly
        then
            echo "Killing \"$process_name\" running with process id: $pid"
        else
            echo "Killing multiple instances of \"$process_name\" running with process ids:"
            echo $pid
        fi
    fi 
done