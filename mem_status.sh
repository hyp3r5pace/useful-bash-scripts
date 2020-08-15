echo "------------------------------------------ MEMORY STATUS ---------------------------------------"

echo "Memory stats shown are a snapshot of the memory state at the time of execution of this script."
echo "Memory state may be different now!"
echo ""


mem_status=$(free -m | grep "Mem:")

total_mem=$(echo $mem_status | grep -o "[0-9]*" | head -n 1)
echo "Total Memory (RAM): $total_mem MB"

used_mem=$(echo $mem_status | grep -o "[0-9]*" | head -n 2 | tail -n 1)
echo "Used Memory (RAM): $used_mem MB"

free_mem=$(echo $mem_status |  grep -o "[0-9]*" | head -n 3 | tail -n 1)
echo "Free memory (RAM): $free_mem MB"

echo "-------------------------------------------------------------------------------------------------"

