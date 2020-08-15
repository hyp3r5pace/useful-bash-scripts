#!/bin/bash

echo "---------------------------------DISK INFORMATION---------------------------------------------------"

drives=("C" "D" "E")
for i in ${!drives[@]};
do
    drive_status=$(df -h | grep ${drives[$i]})

    echo "----------------- ${drives[$i]} Drive information --------------------------"

    total=$(echo $drive_status | grep -o "[0-9]*G" | head -n 1)
    echo "Total ${drives[$i]} Drive space: $total"

    used=$(echo $drive_status | grep -o "[0-9]*G" | head -n 2 | tail -n 1)
    echo "Used ${drives[$i]} Drive space: $used"

    remaining=$(echo $drive_status | grep -o "[0-9.]*G" | tail -n 1)
    echo "Remaining ${drives[$i]} Drive space: $remaining"

    percent=$(echo $drive_status | grep -o "[0-9.]*%")
    echo "${drives[$i]} drive used percentage: $percent"

    echo "-----------------------------------------------------------------------------"
done

echo "------------------------------------------------------------------------------------------------------"

