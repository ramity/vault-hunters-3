#!/bin/bash

# Config
from="./ram_disk"
to="./data"

# Check if the directory is empty
if [ -z "$(ls -A $from)" ]; then
    echo "No data found in $from."
    exit 1
fi

# Export files from ram-disk dir to data dir
# -a archive - keep file permissions and ownership
# -v rebose - show progress
# -R recursive - all files and subfolders in dir
# -u update - copies only if source is newer than destination
cp -a -v -R -u $from $to

# Success message
echo "Copied contents of $from directory to $to directory."
