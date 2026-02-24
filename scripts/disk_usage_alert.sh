#!/bin/bash

# Alert if any mounted filesystem exceeds usage threshold
THRESHOLD=80

echo "==============================="
echo " Disk Usage Report"
echo "==============================="

# Print usage% and mount point for all filesystems (skip header)
df -h | awk 'NR>1 {print $5 " " $6}' | while read output; do

  # Extract numeric usage value (remove % symbol)
  usage=$(echo "$output" | awk '{print $1}' | sed 's/%//g')

  # Extract mount point
  partition=$(echo "$output" | awk '{print $2}')

  # Compare usage against threshold
  if [ "$usage" -ge "$THRESHOLD" ]; then
    echo "[WARNING] $partition is at ${usage}% usage"
  fi

done

