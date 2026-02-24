#!/bin/bash

# Default auth log location (Debian/Ubuntu). Fallback to RHEL/CentOS.
LOG_FILE="/var/log/auth.log"
[ ! -f "$LOG_FILE" ] && LOG_FILE="/var/log/secure"

echo "==============================="
echo " Failed SSH Login Report"
echo "==============================="
echo "Date: $(date)"
echo

# Count usernames involved in "Failed password" events, most frequent first
grep "Failed password" "$LOG_FILE" \
  | awk '{print $(NF-3)}' \
  | sort \
  | uniq -c \
  | sort -nr
