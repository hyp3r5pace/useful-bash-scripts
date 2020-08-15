#!/bin/bash

echo "--------------------------------------------- CPU STATUS ------------------------------------------------"
echo ""

echo "----------------- PASSIVE INFORMATION --------------------------"
echo ""

# info about CPU archiecture
cpu_architecture=$(lscpu | head -n 1)
echo $cpu_architecture

cpu_bit=$(lscpu | grep "CPU op-mode(s)" | grep -o "[0-9]*-bit" | tail -n 1)
echo "Register Bit size(CPU): $cpu_bit"

# CPU model
cpu_model=$(lscpu | grep "Model name:")
echo $cpu_model

# Works for Intel CPU only
org=$(echo $cpu_model | grep -o "Intel")
if [ $org = "Intel" ]
then
base_clock_cycle=$(echo $cpu_model | grep -o "[0-9.]*GHz")
echo "Base clock cycle: $base_clock_cycle"
fi

# Total number of cores(CPU)
num_cores_per_socket=$(lscpu | grep "Core(s) per socket:" | grep -o "[0-9]*")
num_socket=$(lscpu | grep "Socket(s):" | grep -o "[0-9]*")
num_cores=$(($num_cores_per_socket * $num_socket))
echo "Number of CPU cores: $num_cores"

# Total number of Physical threads
threads_per_core=$(lscpu | grep "Thread(s) per core:" | grep -o "[0-9]")
total_threads=$(( $threads_per_core * $num_cores ))
echo "Number of Physical Threads(CPU): $total_threads"

echo ""
echo ""
echo "-------------------- ACTIVE INFORMATION ---------------------------"
echo ""

curr_epoch_duration=$(date +%s)
temp=$(cat /proc/stat | grep "btime")
boot_time_epoch_duration=$(echo $temp | awk '{print $2}')
active_duration_seconds=$(( $curr_epoch_duration - $boot_time_epoch_duration ))
echo "Time duration since last boot: $((${active_duration_seconds} / 3600)) hours: \
$((${active_duration_seconds} % 3600 / 60)) minutes : $((${active_duration_seconds} % 3600 % 60)) seconds"

echo ""
echo "-----------------------------------------------------------------------------------------------------------"