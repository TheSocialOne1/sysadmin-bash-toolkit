#!/bin/bash

# Basic Linux user audit script

echo "==============================="
echo " Linux User Audit Report"
echo "==============================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo

echo "[+] Users with UID >= 1000"
# UID >= 1000 typically represents non-system user accounts
awk -F: '$3 >= 1000 {print $1 " (UID:" $3 ")"}' /etc/passwd
echo

echo "[+] Users with sudo privileges"
# Display members of the sudo group (if present)
getent group sudo | cut -d: -f4
echo

echo "[+] Last 5 logins"
# Show most recent login activity
last -a | head -n 5
echo

echo "[+] Accounts with empty passwords (if any)"
# Identify accounts with no password set (requires root to read /etc/shadow)
awk -F: '($2==""){print $1}' /etc/shadow 2>/dev/null
