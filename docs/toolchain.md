# ReScript Toolchain

- State: Tranche D deterministic-first runtime
- Toolchain source: `repo-local-pnpm`
- Package manager: `pnpm@10.15.0`
- Runtime: Node.js 22
- Compiler: ReScript 12

## Native commands
- `pnpm install --frozen-lockfile`
- `pnpm exec rescript build`
- `pnpm test`
- `python3 scripts/validate_scaffold.py`
- `pnpm run validate:native`

## Notes
- Docker support is maintained but not part of native-only Tranche D validation.
- `flake.nix` exposes a native check wrapper around build, tests, and scaffold validation.
