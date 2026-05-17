# ReScript Edge Cases

- Same-seed JSON runs must remain byte-stable.
- `--focus-family` narrows output to one family and rejects unknown families.
- Later families are explicit grouped fallback and carry `parityClass=grouped-fallback`.
- Experimental provider flags fail fast and do not affect deterministic output.
