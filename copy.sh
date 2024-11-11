#!/bin/bash

# Define the directory to read
directory="./less"

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Directory '$directory' does not exist."
  exit 1
fi

# Create an array of filenames
file_array=()
for file in "$directory"/*; do
  if [ -f "$file" ]; then
    file_array+=("\"$(basename "$file")\"")
  fi
done

# Format the array for JavaScript
array_output="[$(IFS=,; echo "${file_array[*]}")]"

# Copy the array to the clipboard
echo "$array_output" | pbcopy

echo "Filenames copied to clipboard as an array!"
