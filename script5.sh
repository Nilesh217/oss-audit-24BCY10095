#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Nilesh Dwivedi | Course: Open Source Software
# Purpose: Generate a personalized Open Source philosophy statement
# by asking the user three interactive questions and saving it to a .txt file

echo "=========================================="
echo "     Open Source Manifesto Generator"
echo "=========================================="
echo ""

# --- Ask the user three interactive questions ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Generate output file name ---
DATE=$(date '+%d-%B-%Y')
OUTPUT="manifesto_$(whoami)_${DATE}.txt"

# --- Compose the manifesto paragraph ---
echo "==========================================" > "$OUTPUT"
echo "        My Open Source Manifesto" >> "$OUTPUT"
echo "        Date: $DATE" >> "$OUTPUT"
echo "==========================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Every day I rely on $TOOL, a tool built by the open-source community," >> "$OUTPUT"
echo "which reminds me that true power comes from sharing knowledge freely." >> "$OUTPUT"
echo "To me, '$FREEDOM' embodies the spirit of collaboration and innovation." >> "$OUTPUT"
echo "I aspire to build and share $BUILD openly, contributing to a world where technology" >> "$OUTPUT"
echo "is accessible to all, and where ideas can grow beyond individual ownership." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Open source is not just software; it is a philosophy of collective growth." >> "$OUTPUT"
echo "By sharing our creations, we ensure that everyone benefits and learns." >> "$OUTPUT"
echo "==========================================" >> "$OUTPUT"

# --- Display confirmation ---
echo ""
echo "Manifesto generated successfully!"
echo "Saved to file: $OUTPUT"
echo ""
cat "$OUTPUT"

# Concept Demonstrated:
# - read: interactive user input
# - string concatenation using variables
# - writing to a file using >
# - using date command for dynamic filename
# - echo for output and formatting
# - basic file handling in bash
