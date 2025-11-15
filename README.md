# Daily Log Archiver (Linux Automation)

A fully automated logging system that generates a log file every time the terminal opens. Logs include system uptime, CPU usage, disk usage, and archived weekly summaries.

## Features
- Auto-run on terminal open (.bashrc)
- Daily log creation
- Auto-archive logs older than 7 days
- Weekly tar.gz compression
- Monthly summary tracking

## Script File
- daily_log.sh

## Installation
Copy `daily_log.sh` to your home directory and add this line to your `.bashrc`:
