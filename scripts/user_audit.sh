#!/bin/bash

echo "==============================="
echo " Linux User Audit Report"
echo "==============================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo

echo "[+] Users with UID >= 1000"
awk -F: '$3 >= 1000 {print $1 " (UID:" $3 ")"}' /etc/passwd
echo

echo "[+] Users with sudo privileges"
getent group sudo | cut -d: -f4
echo

echo "[+] Last 5 logins"
last -a | head -n 5
echo

echo "[+] Accounts with empty passwords (if any)"
awk -F: '($2==""){print $1}' /etc/shadow 2>/dev/null

