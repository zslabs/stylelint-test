# Stylelint overrides peformance test

This is a performance test for stylelint overrides of varying lengths. [Discussion](https://github.com/stylelint/stylelint/issues/8043#issuecomment-2457169509)

## Test results (bash)

```
./runner.sh

Running stylelint with configuration: stylelint.config.js
Execution time with stylelint.config.js: 3 seconds

Running stylelint with configuration: stylelint-overrides-500.config.js
Execution time with stylelint-overrides-500.config.js: 10 seconds

Running stylelint with configuration: stylelint-overrides-1000.config.js
Execution time with stylelint-overrides-1000.config.js: 16 seconds
```

## Test results (node)

```
npm run stylelint-node
```

Running stylelint with configuration: stylelint.config.js
Execution time with stylelint.config.js: 2 seconds

Running stylelint with configuration: stylelint-overrides-500.config.js
Execution time with stylelint-overrides-500.config.js: 9 seconds

Running stylelint with configuration: stylelint-overrides-1000.config.js
Execution time with stylelint-overrides-1000.config.js: 13 seconds
