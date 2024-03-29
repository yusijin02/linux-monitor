#!/bin/bash

nvidia_output="$(nvidia-smi)"

processes_start_line=$(echo "$nvidia_output" | grep -n -m 1 "Processes:" | cut -d ":" -f 1)

echo "$nvidia_output" | head -n "$processes_start_line"

echo -e "GPU   GI   CI   PID   Type   Process name                          GPU Memory  Username"

echo "$nvidia_output" | tail -n +$((processes_start_line + 2)) | awk '$2 ~ /^[0-9]+$/ && $5 ~ /^[0-9]+$/ {print $0}' | while IFS= read -r line; do
    pid=$(echo "$line" | awk '{print $5}')
    user=$(ps -o uname= -p "$pid")
    [ -z "$user" ] && user="N/A"
    echo "$line  $user"
done | column -t


cpu_cores=$(nproc)

cpu_loads=$(uptime | awk -F'[a-z]:' '{ print $2 }' | awk -v cores="$cpu_cores" '{ printf "%.2f%% %.2f%% %.2f%%\n", $1/cores*100, $2/cores*100, $3/cores*100 }')

echo ""
echo ""
echo "=============================================================================================="
echo "                                          CPU Load"
echo "=============================================================================================="
echo "$cpu_loads" | awk '{ printf "| %-15s | %-15s | %-15s |\n", "1 min", "5 min", "15 min"; printf "| %-15s | %-15s | %-15s |\n", $1, $2, $3 }'
echo ""
echo ""

echo "=============================================================================================="
echo "                                        Memory Usage"
echo "=============================================================================================="
free -h | grep -v Swap
echo ""
echo "| PID       | Username           | Memory    | Command    |"
echo "-------------------------------------------------------------------------------------------"

ps -eo pid,user,rss,comm --sort=-rss | head -n 6 | tail -n 5 | while read pid user rss comm; do
    mem_gb=$(echo "$rss" | awk '{printf "%.2fG", $1/1024/1024}')
    printf "| %-9s | %-18s | %-9s | %-10s |\n" "$pid" "$user" "$mem_gb" "$comm"
done
