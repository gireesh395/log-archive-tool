#!/bin/bash

# 1. Capture the log directory passed via CLI
LOG_DIR=$1

# 2. Check if an argument was provided
if [[ -z "$LOG_DIR" ]]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

# 3. Check if the provided directory actually exists
if [[ ! -d "$LOG_DIR" ]]; then
    echo "ERROR: Directory does not exist: $LOG_DIR"
    exit 1
fi

# 4. Define archive storage directory and timestamp
ARCHIVE_DIR="archived_logs"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
mkdir -p "$ARCHIVE_DIR"

# 5. Define output archive path and log history file
ARCHIVE_FILE="$ARCHIVE_DIR/logs_archive_${TIMESTAMP}.tar.gz"
HISTORY_LOG="archive_history.log"

# 6. Compress target logs
echo "Archiving '$LOG_DIR' to '$ARCHIVE_FILE'..."
tar -czf "$ARCHIVE_FILE" "$LOG_DIR"

# 7. Validate exit status and log the action
if [[ $? -eq 0 ]]; then
    echo "Success: Archive created at $ARCHIVE_FILE"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Successfully archived $LOG_DIR to $ARCHIVE_FILE" >> "$HISTORY_LOG"
else
    echo "ERROR: Compression failed."
    exit 1
fi