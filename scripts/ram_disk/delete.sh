#!/bin/bash

# Config
path="./ram_disk"

# Handle if mount is not present
if ! mountpoint -q "$path"; then
    echo "No mount found at $path."
    exit 1
fi

# Calculate the number of files in path
file_count=$(find "$path" -type f | wc -l)

# Check if .gitkeep is not the only file in the directory
if ! [ "$file_count" -eq 1 ] || ! [ "$(basename "$(find "$path" -type f)")" = ".gitkeep" ]; then
    echo "$path is not empty."
    echo "Please run the provided clear.sh script prior to deleting ram-disk."
    exit 1
fi

# Unmount ram-disk
sudo umount "$path"

# Success message
echo "Deleted ram-disk at $path directory."
