#!/bin/bash

# Config
destination="."

# Check if a zip file argument is provided
if [ $# -eq 0 ]; then
    echo "Please provide the path to the .zip file as a command-line argument."
    exit 1
fi

zip_file=$1

# Make sure the provided zip_file exists
if [ ! -e "$zip_file" ]; then
    echo "File does not exist: $zip_file"
    exit 1
fi

# Unzip the file to the specified directory
# -u update - copies only if source is newer than destination
unzip -u "$zip_file" -d "$destination"

# Success message
echo "Unzipped $zip_file archive to $destination directory."
