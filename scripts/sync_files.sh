#!/bin/bash

# Use environment variables for paths, set in the GitHub Actions workflow
SOURCE_DIR=${SOURCE_DIR}
DEST_DIR=${DEST_DIR}

echo "$SOURCE_DIR"
echo "$DEST_DIR"

# Assume directories exist or are created by the workflow steps
# Copy .md and .mdx files from source to destination if they do not exist in the destination
find "$SOURCE_DIR" -type f \( -name "*.md" -o -name "*.mdx" \) -exec sh -c '
  for file do
    dest="$DEST_DIR/${file#$SOURCE_DIR/}"
    mkdir -p "$(dirname "$dest")"
    rsync -a --ignore-existing "$file" "$dest"
  done
' sh {} +
