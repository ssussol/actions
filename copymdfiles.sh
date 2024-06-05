#!/bin/bash

# Define the source and destination directories
SOURCE_DIR=${SOURCE_DIR}
DEST_DIR=${DEST_DIR}


# Create the destination directory if it does not exist
mkdir -p "$DEST_DIR"

# Copy .md and .mdx files from source to destination if they do not exist in the destination
#find "$SOURCE_DIR" -type f \( -name "*.md" -o -name "*.mdx" \) -exec rsync -a --ignore-existing {} "$DEST_DIR/" \;

# Copy .md and .mdx files from source to destination if they do not exist in the destination
# and maintain the directory structure
find "$SOURCE_DIR" -type f \( -name "*.md" -o -name "*.mdx" \) -exec sh -c '
  for file do
    dest="$DEST_DIR/${file#$SOURCE_DIR/}"
    mkdir -p "$(dirname "$dest")"
    rsync -a --ignore-existing "$file" "$dest"
  done
' sh {} +
