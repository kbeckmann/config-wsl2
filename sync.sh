#!/bin/bash

# Check if the required argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <store|restore>"
    exit 1
fi

# Get the absolute path of the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

USERDIR="/mnt/c/Users/$USER"

# List of absolute file paths to be managed
FILES=(
    # Files in windows-land
    "${USERDIR}/.wezterm.lua"

    # Files in the lunix homedir
    "${HOME}/.zshrc"
)

# Perform the operation based on the argument
case $1 in
    store)
        for FILE in "${FILES[@]}"; do
            if [ -f "$FILE" ]; then
                cp "$FILE" "$SCRIPT_DIR"
                echo "Stored: $FILE"
            else
                echo "Warning: $FILE does not exist"
            fi
        done
        ;;
    restore)
        for FILE in "${FILES[@]}"; do
            BASENAME=$(basename "$FILE")
            if [ -f "$SCRIPT_DIR/$BASENAME" ]; then
                cp "$SCRIPT_DIR/$BASENAME" "$FILE"
                echo "Restored: $FILE"
            else
                echo "Warning: $SCRIPT_DIR/$BASENAME does not exist"
            fi
        done
        ;;
    *)
        echo "Invalid argument: $1"
        echo "Usage: $0 <store|restore>"
        exit 1
        ;;
esac

