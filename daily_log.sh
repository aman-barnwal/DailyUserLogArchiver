#!/bin/bash

# =========================
# Daily User Log Archiver 
# File: daily_log.sh
# Author: Aman Barnwal
# =========================

# === Absolute paths (required for .bashrc auto-run) ===
USER_HOME="/home/$USER"
LOG_DIR="$USER_HOME/daily_logs"
ARCHIVE_DIR="$LOG_DIR/archive"
MONTHLY_SUMMARY="$LOG_DIR/monthly_summary.txt"

# === Ensure required directories exist ===
mkdir -p "$LOG_DIR" "$ARCHIVE_DIR"

# === Create a timestamped log file ===
NOW=$(date +'%Y-%m-%d_%H-%M-%S')
LOG_FILE="$LOG_DIR/log_$NOW.txt"

{
echo "===== Daily User Log Archiver ====="
echo "User: $USER"
echo "Date: $(date)"
echo "------------------------------------"
echo "System Uptime:"
uptime -p
echo "------------------------------------"
echo "Top 5 CPU-consuming processes:"
ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -n 6
echo "------------------------------------"
echo "Disk Usage:"
df -h
echo "------------------------------------"
echo "Logs currently in $LOG_DIR:"
ls -lh "$LOG_DIR"
echo "===================================="
} >> "$LOG_FILE"

# === Archive logs older than 7 days ===
find "$LOG_DIR" -maxdepth 1 -name "log_*.txt" -mtime +7 -exec mv {} "$ARCHIVE_DIR" \;

# === Weekly tar compression of archived logs ===
if compgen -G "$ARCHIVE_DIR/*.txt" > /dev/null; then
    TAR_NAME="$ARCHIVE_DIR/archive_$(date +'%Y-%m-%d').tar.gz"
    tar -czf "$TAR_NAME" -C "$ARCHIVE_DIR" . --remove-files
fi

# === Append info to monthly summary ===
echo "[$(date)] Log created: $LOG_FILE" >> "$MONTHLY_SUMMARY"

exit 0

