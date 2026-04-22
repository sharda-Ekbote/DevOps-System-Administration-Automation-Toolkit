#!/bin/bash
# Description: Audit active services on web ports (80/443)
# Requirements: iproute2 (ss), lsof

echo "--- Active Listening Services (Port 80/443) ---"

# 1. Using 'ss' to find sockets
# -t (tcp) -u (udp) -l (listening) -p (process) -n (numeric)
echo "Checking Socket Statistics..."
ss -tulpn | grep -E ':80|:443'

echo -e "\n--- Process Details for Port 443 ---"

# 2. Using 'lsof' for deep process inspection
# Corrected syntax: -i :port
if command -v lsof &> /dev/null; then
    lsof -i :443
else
    echo "lsof not installed, skipping deep inspection."
fi
