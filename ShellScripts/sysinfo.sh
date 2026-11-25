#!/usr/bin/env bash
# Author: Yasesh Kumar (2601730181)
# Description: Prints a formatted system information report.
set -euo pipefail
echo "============================================================"
echo "System Info | Name: Yasesh Kumar | Roll No: 2601730181 | Date: $(date)"
echo "============================================================"
echo "CPU Model : $(awk -F: '/model name/ {gsub(/^[ \t]+/, "", $2); print $2; exit}' /proc/cpuinfo)"
echo "CPU Cores : $(nproc)"
echo "Memory    : $(free -h | awk '/^Mem:/ {printf "Total: %s | Used: %s", $2, $3}')"
echo ""
echo "Top 3 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --no-headers | sort -k3 -nr | head -n 3
echo "============================================================"
echo "Report generated successfully."
