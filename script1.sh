#!/bin/bash
# Script 1: System Identity Report
# Author: Nilesh Dwivedi | Course: Open Source Software
# Purpose: Display Linux system info as a welcome screen for the Open Source Audit

# --- Variables ---
STUDENT_NAME="Nilesh Dwivedi"       # Your name
SOFTWARE_CHOICE="Linux Kernel"      # Chosen software for audit

# --- System info ---
KERNEL=$(uname -r)                  # Get kernel version
USER_NAME=$(whoami)                 # Get current logged-in user
USER_HOME=$(eval echo ~$USER_NAME)  # Get user's home directory
UPTIME=$(uptime -p)                 # Get system uptime
DISTRO=$(grep "^PRETTY_NAME" /etc/os-release | cut -d '=' -f2 | tr -d '"')  # Distribution name
CURRENT_DATE=$(date '+%d %B %Y, %H:%M:%S')  # Current date and time
LICENSE="GNU General Public License v2 (GPLv2)" # License covering Linux Kernel

# --- Display ---
echo "=========================================="
echo "     Open Source Audit — $STUDENT_NAME"
echo "=========================================="
echo "Linux Distribution : $DISTRO"
echo "Kernel Version      : $KERNEL"
echo "Logged-in User      : $USER_NAME"
echo "Home Directory      : $USER_HOME"
echo "System Uptime       : $UPTIME"
echo "Current Date/Time   : $CURRENT_DATE"
echo "License             : $LICENSE"
echo "=========================================="
echo "Welcome! This system runs the $SOFTWARE_CHOICE under the principles of open source."
echo "Enjoy exploring, modifying, and learning from this freely available software!"
echo "=========================================="
