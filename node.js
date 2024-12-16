const stylelint = require("stylelint");
const fs = require("fs");
const path = require("path");

// Array of configuration files
const configs = [
  "stylelint.config.js",
  "stylelint-overrides-500.config.js",
  "stylelint-overrides-1000.config.js",
];

// Files or directory to lint (adjust the glob pattern as needed)
const files = "**/*.less";

// Helper function to run stylelint with a specific configuration
const runStylelint = async (config, files) => {
  const configPath = path.resolve(config);

  // Check if the config file exists
  if (!fs.existsSync(configPath)) {
    console.log(`Config file '${config}' does not exist.`);
    return;
  }

  console.log(`Running stylelint with configuration: ${config}`);

  // Record the start time
  const startTime = Date.now();

  try {
    // Run stylelint
    const result = await stylelint.lint({
      files: files,
      configFile: configPath,
    });

    // Output warnings and errors
    if (result.errored) {
      console.error(`Errors with ${config}:`);
      console.error(result.output);
    } else {
      console.log(`No errors with ${config}.`);
    }
  } catch (error) {
    console.error(`Error running stylelint with ${config}:`, error.message);
  }

  // Record the end time
  const endTime = Date.now();

  // Calculate and display the elapsed time
  const elapsedTime = Math.round((endTime - startTime) / 1000);
  console.log(`Execution time with ${config}: ${elapsedTime} seconds`);
  console.log();
};

// Run the script
(async () => {
  for (const config of configs) {
    await runStylelint(config, files);
  }
})();
