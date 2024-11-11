#!/bin/bash

# Array of configuration files
configs=("stylelint.config.js" "stylelint-overrides-500.config.js" "stylelint-overrides-1000.config.js")

# Files or directory to lint (adjust the glob pattern as needed)
files="**/*.less"

# Loop through each config and measure time
for config in "${configs[@]}"; do
  if [ ! -f "$config" ]; then
    echo "Config file '$config' does not exist."
    continue
  fi

  echo "Running stylelint with configuration: $config"

  # Record the start time
  start_time=$(date +%s)

  # Run stylelint with the specified config
  npx stylelint "$files" --config "$config"

  # Record the end time
  end_time=$(date +%s)

  # Calculate and display the elapsed time
  elapsed_time=$((end_time - start_time))
  echo "Execution time with $config: $elapsed_time seconds"
  echo
done
