# ReScript Example Outputs

## List values
```bash
node lib/es6/rescript_src/Cli.mjs --list-values
```

## Dedicated modern-core JSON
```bash
node lib/es6/rescript_src/Cli.mjs --output-format json --seed 42 --focus-family agent-workflows
```

## Grouped fallback JSON
```bash
node lib/es6/rescript_src/Cli.mjs --output-format json --seed 7 --focus-family mcp-a2a-ops
```

## Experimental fail-fast
```bash
node lib/es6/rescript_src/Cli.mjs --experimental-provider openai-compatible-api
```
