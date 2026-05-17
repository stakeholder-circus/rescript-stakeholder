# Contributing to rescript-stakeholder

## Rules
- Treat Rust as the source-of-truth baseline and Java as an audit anchor for CLI/error parity expectations.
- Use Conventional Commits.
- Do not land silent behavioral changes; update local traceability and gaps in the same tranche.
- Keep deterministic seeded behavior stable unless the change is explicitly documented as baseline evolution.

## Local workflow
- `pnpm install --frozen-lockfile`
- `pnpm exec rescript build`
- `pnpm test`
- `python3 scripts/validate_scaffold.py`
- `pnpm run validate:native`

## Change discipline
- Experimental provider work must stay clearly separated from deterministic parity paths.
- Later-family behavior must remain grouped fallback until implemented as dedicated parity.
