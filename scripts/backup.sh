#!/bin/bash

# Config
path="./data"

# Check if the directory is empty
if [ -z "$(ls -A $path)" ]; then
    echo "No data found in $path."
    exit 1
fi

# Zip and export archive from data to backups dir
zip -9 ./backups/$(date '+%s').zip -r $path

# Success message
echo "Zipped contents of $path to new zip archive."
