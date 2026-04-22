#!/bin/bash
# Description: Check if critical web ports are open on a target
# Usage: ./check_connectivity.sh google.com

TARGET=$1
OUTPUT_FILE="network_audit.txt"

if [ -z "$TARGET" ]; then
    echo "Error: Please provide a target domain (e.g., ./check_connectivity.sh google.com)"
    exit 1
fi

echo "--- Audit for $TARGET at $(date) ---" >> $OUTPUT_FILE

# Run nmap with specific ports
# -Pn: Treats the host as online (prevents being blocked by some firewalls)
nmap -p 80,22,443 $TARGET >> $OUTPUT_FILE

echo "Audit complete. Results saved to $OUTPUT_FILE"
