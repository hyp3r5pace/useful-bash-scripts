#!/bin/zsh

echo "---------------------BATTERY INFORMATION------------------------------"

percentage=$(cat /sys/class/power_supply/battery/capacity)
echo "current charge percentage: $percentage%"

charging_status=$(cat /sys/class/power_supply/battery/status)
echo "charging status: $charging_status"

health=$(cat /sys/class/power_supply/battery/health)
echo "battery health: $health"

battery_num=$(cat /sys/class/power_supply/battery/present)
echo "number of batteries: $battery_num"

battery_type=$(cat /sys/class/power_supply/battery/technology)
echo "battery type: $battery_type"

temp=$(cat /sys/class/power_supply/battery/temp)
echo "battery temperature: $temp F"
# Doubt in the above temperature unit

echo "----------------------------------------------------------------------"
