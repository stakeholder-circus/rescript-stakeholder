> [!WARNING]
> This repository is AI-assisted and manually reviewed. It is a local-only ReScript parity target; do not attach upstream tracking during local tranche work.

# rescript-stakeholder

Deterministic-first ReScript/Node CLI for the stakeholder rewrite program.

## Status
- Tranche D runtime is implemented with repo-local pnpm/ReScript.
- Native deterministic validation is the active gate.
- Docker support is defined but was not run for this tranche.

## CLI
```bash
pnpm exec rescript build
node lib/es6/rescript_src/Cli.mjs --list-values
node lib/es6/rescript_src/Cli.mjs --output-format json --seed 42 --focus-family agent-workflows
```

Supported tranche flags:
- `--list-values`
- `--focus-family <family>`
- `--output-format text|json`
- `--seed <integer>`
- `--experimental-provider <provider>` fail-fast only

## Coverage
- Dedicated classic-six: `code-analyzer`, `data-processing`, `jargon`, `metrics`, `network-activity`, `system-monitoring`.
- Dedicated modern-core: `agent-workflows`, `platform-engineering`, `observability-ai-runtime`, `delivery-preview-ops`, `supply-chain-security`.
- Later families remain deterministic grouped fallback and are documented in `GAPS.md`.
