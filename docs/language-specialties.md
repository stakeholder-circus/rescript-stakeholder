# ReScript Language Specialties

- ReScript compiles the CLI to native Node ESM through repo-local pnpm.
- The implementation avoids timing-dependent assertions by emitting normalized synthetic timestamps.
- JSON is line-delimited for stable fixture comparison and terminal-friendly text remains available.
