#!/bin/bash

# This script logs internet speed test results to a CSV file. 
# It first checks if the log file exists, and creates it with header if not.
# It runs a speedtest-cli command and parses the output to get ping, download and upload values. 
# These are logged to the CSV along with a timestamp.
# The results are also printed to console for immediate feedback.

log_file="/home/$USER/net_speed/net_speed_log/net_log.csv"

if [ ! -f "$log_file" ]; then
    echo "Timestamp,Ping (ms),Download (Mbit/s),Upload (Mbit/s)" > "$log_file"
fi

current_time=$(date "+%Y-%m-%d %H:%M:%S")

speedtest_result=$(speedtest-cli --simple)

ping=$(echo "$speedtest_result" | awk '/Ping/ {print $2}')
download=$(echo "$speedtest_result" | awk '/Download/ {print $2}')
upload=$(echo "$speedtest_result" | awk '/Upload/ {print $2}')

echo "$current_time,$ping,$download,$upload" >> "$log_file"

echo "$current_time Ping: $ping ms Download: $download Mbit/s Upload: $upload Mbit/s"

# data usage 25 mb down 26.52 mb upd