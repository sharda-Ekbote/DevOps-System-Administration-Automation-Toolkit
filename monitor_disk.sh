#!/bin/bash
# Description: Monitor root partition disk usage and alert if above 90%
# Logic: Uses df, grep, awk, and sed to isolate the percentage integer


disk_usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

THRESHOLD=90

echo "Current Disk Usage: $disk_usage%"


if [ "$disk_usage" -gt "$THRESHOLD" ]; then
    echo "CRITICAL ALERT: Disk usage on / has exceeded $THRESHOLD%!"
    echo "Top 5 largest files in /var/log:"
    du -ah /var/log | sort -rh | head -n 5
else
    echo "Disk space is within safe limits."
fi
