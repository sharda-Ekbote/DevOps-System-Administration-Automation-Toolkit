#!/bin/bash
# Description: Find and compress logs larger than 100MB to save disk space
# Requirements: find, gzip

LOG_DIR="/var/log"
SIZE_LIMIT="100M"

echo "Starting log compression for files larger than $SIZE_LIMIT in $LOG_DIR..."

# 1. Logic: Find .log files, ignore already compressed .gz files
# 2. Execution: gzip the files to save space
find "$LOG_DIR" -type f -name "*.log" -size +"$SIZE_LIMIT" -exec gzip -v {} \;

echo "Archiving complete. Large logs have been compressed."
