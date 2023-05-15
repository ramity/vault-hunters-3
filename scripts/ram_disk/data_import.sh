#!/bin/bash

# Config
from="./data"
to="./ram_disk"

# Check if the directory is empty
if [ -z "$(ls -A $from)" ]; then
    echo "No data found in $from."
    exit 1
fi

# Import files from data dir to ram-disk dir
# -v rebose - show progress
# -R recursive - all files and subfolders in dir
# -u update - copies only if source is newer than destination
cp -v -R -u $from $to

# Success message
echo "Copied contents of $from directory to $to directory."
