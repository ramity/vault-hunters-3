#!/bin/bash

# Config
path="./ram_disk"

# Make dir if it does not already exist
mkdir -p $path

# Handle if mount is already present
if mountpoint -q "$path"; then
    echo "Mount already found at $path."
    exit 1
fi

# Create a temporary ram disk with 4G size
sudo mount -t tmpfs -o rw,size=4G tmpfs $path

# Success message
echo "Created ram-disk at $path directory."
