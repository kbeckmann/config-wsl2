#!/bin/bash

# Check if the required argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <store|restore>"
    exit 1
fi

# Get the absolute path of the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

USERDIR="/mnt/c/Users/$USER"

# WSL-specific stuff
if [ "${WSLENV}" != "" ]; then
    WSLFILES=(
        "${USERDIR}/.wezterm.lua"
    )
else
    WSLFILES=()
fi

# List of absolute file paths to be managed
FILES=(
    ${WSLFILES[@]}

    # Files in the lunix homedir
    "${HOME}/.zshrc"
    "${HOME}/.config/nvim"
    "${HOME}/.config/git/ignore" # Global .gitignore
)

# Perform the operation based on the argument
case $1 in
    store)
        for FILE in "${FILES[@]}"; do
            if [ -f "$FILE" ]; then
                cp "$FILE" "$SCRIPT_DIR"
                echo "Stored: $FILE"
	    elif [ -d "$FILE" ]; then
                cp -rvp "$FILE" "$SCRIPT_DIR"
                echo "Stored dir: $FILE"
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
            elif [ -d "$SCRIPT_DIR/$BASENAME" ]; then
                cp -rvp "$SCRIPT_DIR/$BASENAME" "$FILE"
                echo "Restored dir: $FILE"
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

