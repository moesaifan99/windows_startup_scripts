#!/bin/bash

# Source folder (Windows Startup folder)
SRC="$HOME/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

# Destination folder
DEST="$HOME/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/windows_startup_scripts"

# Create destination folder if it doesn't exist
mkdir -p "$DEST"

# Copy everything from SRC to DEST
cp -r "$SRC/"* "$DEST/"

echo "All files copied from:"
echo "$SRC"
echo "to:"
echo "$DEST"
