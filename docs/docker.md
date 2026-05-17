# ReScript Docker

## Build and test
- `docker build -t rescript-stakeholder .`
- `docker run --rm rescript-stakeholder --list-values`

## Rationale
- The image builds the ReScript CLI with repo-local pnpm before copying compiled Node output into the runtime layer.
- Docker was updated for parity but intentionally not run during native-only Tranche D validation.
