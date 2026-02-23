#!/bin/bash

LOG_FILE="/var/log/auth.log"

if [ ! -f "$LOG_FILE" ]; then
    LOG_FILE="/var/log/secure"
fi

echo "==============================="
echo " Failed SSH Login Report"
echo "==============================="
echo "Date: $(date)"
echo

grep "Failed password" $LOG_FILE | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr

