# rescript-stakeholder Status

- Role: selected next-20 local-only ReScript parity target
- Parity class: deterministic-first full-parity target
- State: tranche-d-native-implemented
- Rewrite completeness: 42%
- Functionality completeness: 38%
- Branch: `main`
- Origin: `git@github.com:stakeholder-circus/rescript-stakeholder.git`
- Upstream: `https://github.com/giacomo-b/rust-stakeholder`

## Complete in Tranche D
- Replaced active Rust validation with repo-local pnpm/ReScript native validation.
- Added deterministic ReScript/Node CLI.
- Added `--list-values`, `--focus-family`, `--output-format text|json`, `--seed`, and experimental-provider fail-fast.
- Implemented dedicated classic-six plus modern-core descriptors.
- Added grouped deterministic fallback for later families.

## Blockers
- Full live-provider/runtime support is deferred to the second-pass provider rollout wave.
- Later-family dedicated generators remain grouped fallback.
- Publication is blocked until the publication/governance wave completes and remote access is available.
