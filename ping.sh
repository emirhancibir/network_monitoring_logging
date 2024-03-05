#!/bin/bash

ping_count=5 
interval=1     # sn


log_file="/home/$USER/net_speed/net_speed_log/ping_log.csv"


if [ ! -f "$log_file" ]; then
    echo "Timestamp,Response Time (ms)" > "$log_file"
fi



# Ping google.com $ping_count times, waiting $interval seconds between pings. 
# Log timestamp and response time to $log_file in CSV format.
for ((i=0; i<$ping_count; i++)); do
    current_time=$(date "+%Y-%m-%d %H:%M:%S")

    ping_result=$(ping -c 1 google.com | grep 'time=' | awk -F '=' '{print $4}' | awk '{print $1}')

    echo "$current_time,$ping_result" >> "$log_file"

    sleep $interval
done
