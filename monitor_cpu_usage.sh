#!/bin/bash
# Description: Monitor CPU usage and identify top 5 processes
# Requirements: awk, top


cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

if (( $(echo "$cpu_usage > 75" | bc -l) )); then 
    echo "High CPU usage: $cpu_usage%"
   #Add the 'ps' command here to show the top processes
    ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6
else 
    echo "Normal CPU usage: $cpu_usage%"
fi