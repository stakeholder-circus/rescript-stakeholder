# ReScript Tooling

## Commands
- `pnpm install --frozen-lockfile`
- `pnpm exec rescript build`
- `pnpm test`
- `python3 scripts/validate_scaffold.py`
- `pnpm run validate:native`

## Optional container commands
- `docker build -t rescript-stakeholder .`
- `docker run --rm rescript-stakeholder --list-values`

## Notes
- Native CI covers Linux, macOS, and Windows.
- Docker is not part of the native-only validation request for Tranche D.
