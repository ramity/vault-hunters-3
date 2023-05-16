#!/bin/bash

# Config
path="./ram_disk"

# Handle if mount is not present
if ! mountpoint -q "$path"; then
    echo "No mount found at $path."
    exit 1
fi

# Check if the directory is not empty
if ! [ -z "$(ls -A $path)" ]; then
    echo "$path is not empty."
    echo "Please run the provided clear.sh script prior to deleting ram-disk."
    exit 1
fi

# Unmount ram-disk
sudo umount "$path"

# Success message
echo "Deleted ram-disk at $path directory."
