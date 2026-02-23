#!/bin/bash

THRESHOLD=80

echo "==============================="
echo " Disk Usage Report"
echo "==============================="

df -h | awk 'NR>1 {print $5 " " $6}' | while read output;
do
  usage=$(echo $output | awk '{print $1}' | sed 's/%//g')
  partition=$(echo $output | awk '{print $2}')

  if [ $usage -ge $THRESHOLD ]; then
    echo "[WARNING] $partition is at ${usage}% usage"
  fi
done

