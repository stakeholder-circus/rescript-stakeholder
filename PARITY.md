# ReScript Parity

- Role: local-only full-parity target in the next-20 wave
- Parity class: deterministic-first

## Review model
- Rust remains the canonical source-of-truth.
- Java audit docs confirm strict CLI/error categories and normalized seeded output expectations.
- This repo implements Tranche D deterministic parity locally without editing `stakeholder-core`.

## Implemented surface
- Strict flags: `--list-values`, `--focus-family`, `--output-format text|json`, `--seed`.
- Fail-fast: `--experimental-provider` exits non-zero with an explicit gap reference.
- Normalized JSON: timestamps are synthetic `T+NNNNNNms`, event order is deterministic, and same-seed output is stable.
- Dedicated families: classic-six plus modern-core.
- Grouped fallback: all later families are visible and deterministic but not claimed as dedicated parity.
