#!/bin/bash

# Config
path="./ram_disk"

# Check if the directory is empty
if [ -z "$(ls -A $path)" ]; then
    echo "No data found in $path."
    exit 1
fi

# Make sure the user wants to continue
echo "The ram-disk directory currently contains data."
echo "Please ensure that ram-disk data has been exported."
echo "Continuing execution will nuke the contents of the $path directory."
read -p "Do you want to continue? (Y/N): " choice
case "$choice" in
    y|Y)
        echo "Nuking data..."
        # Nuke the contents of the configured ram-disk dir
        # -v rebose - show progress
        # -r recursive - all files and subfolders in dir
        # -f force - ignore nonexistent files, never prompt
        rm -v -r -f $path/*
        ;;
    n|N)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
esac

# Success message
echo "Cleared contents of $path directory."
