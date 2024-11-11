#!/bin/bash

# Directory to store generated .less files
output_dir="./less"
mkdir -p "$output_dir"

# Generate 1,000 .less files
for i in {1..1000}; do
  # Generate a random filename with 10 alphanumeric characters
  filename="$(tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 10).less"

  # Write content to the file
  echo ".component {" > "$output_dir/$filename"
  echo "  color: blue;" >> "$output_dir/$filename"
  echo "}" >> "$output_dir/$filename"
done

echo "Generated 1,000 .less files in the '$output_dir' directory."
