# Daily User Log Archiver

This project is a Linux automation tool that generates a detailed system log **every time the terminal opens**.  
It captures important system information, stores logs with timestamps, archives old logs, creates weekly compressed backups, and maintains a monthly summary.

---

## What This Program Does

The Daily User Log Archiver performs the following tasks automatically:

- Creates a new log file every time the terminal is opened
- Records:
  - System uptime
  - Top CPU-consuming processes
  - Disk usage
  - Current list of logs
- Archives log files older than 7 days
- Compresses archived logs weekly as `.tar.gz`
- Maintains a `monthly_summary.txt` with timestamps of every log creation
- Stores everything neatly inside `~/daily_logs`

This ensures you always have a clean, organized history of your system activity without manually running any commands.

---

## Files

### Script  
- [daily_log.sh](./daily_log.sh)

### Output Screenshots  
- [output1.png](./output1.png)  
- [output2.png](./output2.png)

---

## Features

- Fully automatic on every terminal launch  
- Timestamped logs  
- Auto-archiving and weekly compression  
- Monthly summary tracking  
- Lightweight and background-safe  
- Organized file structure

---

## Installation

1. Move the script to your home directory:
```bash
mv daily_log.sh ~/
chmod +x ~/daily_log.sh

