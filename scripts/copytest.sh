#!/bin/bash

#list folders
ls -p .. | grep '/$'

# Define the source and destination directories
SOURCE_DIR="../dir2"
DEST_DIR="dir3"

# Create the destination directory if it does not exist
mkdir -p "$DEST_DIR"

# Copy .md and .mdx files from source to destination if they do not exist in the destination
find "$SOURCE_DIR" -type f \( -name "*.md" -o -name "*.mdx" \) -exec rsync -a --ignore-existing {} "$DEST_DIR/" \;
