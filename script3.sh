#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Nilesh Dwivedi | Course: Open Source Software
# Purpose: Analyze important system directories for disk usage,
# permissions, ownership, and check Linux kernel config directory

# --- Directories to Audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=========================================="
echo "        Directory Audit Report"
echo "=========================================="

# --- Loop through directories ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        
        # Extract permissions, owner, group
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        
        # Get directory size
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        echo "Directory : $DIR"
        echo "Permissions: $PERMS"
        echo "Owner      : $OWNER"
        echo "Group      : $GROUP"
        echo "Size       : $SIZE"
        echo "------------------------------------------"
        
    else
        echo "Directory : $DIR does not exist"
        echo "------------------------------------------"
    fi
done

# --- Kernel Config Directory Check ---
echo ""
echo "=========================================="
echo " Kernel Configuration Directory Check"
echo "=========================================="

KERNEL_CONFIG="/boot"

if [ -d "$KERNEL_CONFIG" ]; then
    echo "Kernel directory exists at $KERNEL_CONFIG"
    
    PERMS=$(ls -ld "$KERNEL_CONFIG" | awk '{print $1}')
    OWNER=$(ls -ld "$KERNEL_CONFIG" | awk '{print $3}')
    GROUP=$(ls -ld "$KERNEL_CONFIG" | awk '{print $4}')
    
    echo "Permissions: $PERMS"
    echo "Owner      : $OWNER"
    echo "Group      : $GROUP"
else
    echo "Kernel directory not found."
fi

echo "=========================================="
echo "Audit Completed Successfully."
echo "=========================================="
