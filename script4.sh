#!/bin/bash
# Script 4: Log File Analyzer
# Author: Nilesh Dwivedi | Course: Open Source Software
# Purpose: Analyze a log file, count occurrences of a keyword, and display matching lines

# --- Usage check ---
if [ $# -lt 1 ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog ERROR"
    exit 1
fi

# --- Variables ---
LOGFILE="$1"                     # Log file to analyze
KEYWORD="${2:-error}"            # Keyword to search; default is 'error'
COUNT=0                          # Counter for occurrences
MATCH_LINES="/tmp/matched_lines.txt" # Temporary file for storing matched lines

# --- File existence check ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# --- Read file line by line ---
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        echo "$LINE" >> "$MATCH_LINES"
    fi
done < "$LOGFILE"

# --- Output results ---
echo "=========================================="
echo "Log File Analyzer Report"
echo "=========================================="
echo "Log file       : $LOGFILE"
echo "Keyword        : $KEYWORD"
echo "Occurrences    : $COUNT"
echo "Last 5 matching lines:"
tail -n 5 "$MATCH_LINES"
echo "=========================================="

# --- Retry if file is empty ---
if [ ! -s "$MATCH_LINES" ]; then
    echo "No matches found for '$KEYWORD'. Retrying..."
    sleep 2
    tail -n 5 "$LOGFILE" | grep -i "$KEYWORD"
fi

# --- Cleanup ---
rm -f "$MATCH_LINES"

echo "Analysis Completed."
