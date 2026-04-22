#!/bin/bash
# Description: Identify logs larger than 500MB for potential rotation
# Requirements: find

LOG_DIR="/var/log"
SIZE_LIMIT="+500M"
REPORT_FILE="large_logs_$(date +%F).txt"

echo "Scanning $LOG_DIR for files larger than $SIZE_LIMIT..."

# Find and list details, then save to a report
find $LOG_DIR -type f -name "*.log" -size $SIZE_LIMIT -exec ls -lh {} \; > "$REPORT_FILE"

# Check if the report is empty
if [ -s "$REPORT_FILE" ]; then
    echo "Alert: Large logs found! Details saved to $REPORT_FILE"
    cat "$REPORT_FILE"
else
    echo "System Healthy: No logs exceed the size limit."
    rm "$REPORT_FILE"
fi
