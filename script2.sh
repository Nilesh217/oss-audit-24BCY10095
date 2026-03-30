#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Nilesh Dwivedi | Course: Open Source Software
# Purpose: Check if a chosen FOSS package is installed, display version info, and print a brief philosophy note

# --- Variables ---
PACKAGE="linux-image-amd64"   # Package to inspect; adjust to your distro if needed
SOFTWARE_CHOICE="Linux Kernel"  # Your chosen software

# --- Check if package is installed ---
if dpkg -l | grep -qw "$PACKAGE"; then
    echo "========================================"
    echo "$PACKAGE is installed on this system."
    echo "========================================"
    
    # Display package version and license
    dpkg -l "$PACKAGE" | awk 'NR==6 {print "Version: "$3}'  # 6th line usually has installed package info
    echo "License: GNU General Public License v2 (GPLv2)"
    
else
    echo "========================================"
    echo "$PACKAGE is NOT installed on this system."
    echo "Please install it to proceed with the audit."
    echo "========================================"
fi

# --- Philosophy Note Using Case Statement ---
# Print a short note about the purpose/philosophy of the package
case "$PACKAGE" in
    linux-image-amd64)
        echo "Linux Kernel: The open-source heart of countless devices and servers worldwide, freely inspectable and modifiable."
        ;;
    apache2)
        echo "Apache HTTP Server: Powers a large part of the internet with open collaboration."
        ;;
    mysql-server)
        echo "MySQL: Community-driven database software enabling millions of applications."
        ;;
    firefox)
        echo "Firefox: A browser protecting users' rights to an open web."
        ;;
    vlc)
        echo "VLC Media Player: Plays almost anything — built on student collaboration and open sharing."
        ;;
    *)
        echo "This package is part of the open-source ecosystem and follows principles of transparency, collaboration, and freedom."
        ;;
esac
