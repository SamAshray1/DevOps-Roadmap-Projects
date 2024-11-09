#!/bin/bash

# Check if log directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: log-archive <log-directory>"
    exit 1
fi

LOG_DIR="$1"  # The directory containing logs to compress
ARCHIVE_DIR="archives"  # Directory to store the archive
LOG_FILE="archive_log.txt"  # Log file to record archive operations

# Create the archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Generate a timestamp for the archive filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Define the name of the archive file
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

# Compress the logs into the tar.gz archive
tar -czf "${ARCHIVE_DIR}/${ARCHIVE_NAME}" -C "$LOG_DIR" .

# Log the date and time of the archive creation
echo "Archived ${LOG_DIR} at $(date) into ${ARCHIVE_NAME}" >> "$LOG_FILE"

echo "Logs have been archived to ${ARCHIVE_DIR}/${ARCHIVE_NAME} and recorded in ${LOG_FILE}."
