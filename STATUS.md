# rescript-stakeholder Status

- Role: selected next-20 local-only ReScript parity target
- Parity class: deterministic-first full-parity target
- State: native-validated local deterministic tranche
- Rewrite completeness: 46%
- Functionality completeness: 42%
- Branch: `main`
- Origin: `git@github.com:stakeholder-circus/rescript-stakeholder.git`
- Upstream: `https://github.com/giacomo-b/rust-stakeholder`

## Complete in Tranche D
- Replaced active Rust validation with repo-local pnpm/ReScript native validation.
- Added deterministic ReScript/Node CLI.
- Added `--list-values`, `--focus-family`, `--output-format text|json`, `--seed`, and experimental-provider fail-fast.
- Implemented dedicated classic-six plus modern-core descriptors.
- Added grouped deterministic fallback for later families.

## Evidence
- `python3 scripts/validate_scaffold.py`
- `./node_modules/.bin/rescript build`
- `python3 scripts/validate_native.py`
- `node tests/native_validation.mjs`
- `node lib/es6/rescript_src/Cli.mjs --list-values`
- same-seed deterministic JSON diff for `platform-engineering`
- explicit `--experimental-provider local-demo` fail-fast smoke

## Blockers
- Full live-provider/runtime support is deferred to the second-pass provider rollout wave.
- Later-family dedicated generators remain grouped fallback.
- Publication is blocked until the publication/governance wave completes and remote access is available.
