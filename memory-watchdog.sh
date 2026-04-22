#!/bin/bash
# Description: Monitor RAM usage and alert if above 80%
# Requirements: awk, free, bc

# 1. Calculate current memory usage percentage
# We take 'used' and 'total' from the 'free' command
mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# 2. Set your threshold
THRESHOLD=80

echo "Current Memory Usage: ${mem_usage}%"

# 3. Logic: If usage is over threshold, show the top processes
if (( $(echo "$mem_usage > $THRESHOLD" | bc -l) )); then
    echo "ALERT: Memory usage exceeded $THRESHOLD%!"
    echo "Top 5 Memory-Consuming Processes:"
       ps aux --sort=-%mem | head -n 6
else
    echo "Memory levels are healthy."
fi
