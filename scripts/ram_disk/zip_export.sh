#!/bin/bash

# Config
path="./ram_disk"

# Check if the directory is empty
if [ -z "$(ls -A $path)" ]; then
    echo "No data found in $path."
    exit 1
fi

# Zip and export archive from ram-disk to export dir
zip -9 ./exports/$(date '+%s').zip -r $path

# Success message
echo "Zipped contents of $path to new zip archive."
