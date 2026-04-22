#!/bin/bash
# Description: Find and delete files older than 30 days
# Requirements: find

TARGET_DIR="/path/to/dir"
DAYS=30

# 1. Corrected Syntax:
# -type f (not -f)
# -exec rm {} (you need a command like rm after -exec)
find "$TARGET_DIR" -type f -mtime +$DAYS -exec rm -f {} \;

echo "Cleanup complete: Files older than $DAYS days removed from $TARGET_DIR."
