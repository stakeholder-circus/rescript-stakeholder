  # ReScript Toolchain

  - State: scaffold-only next-20 prep
  - Toolchain source: `repo-local-pnpm`

  ## Planned commands after promotion
    - `pnpm init`
- `pnpm add -D rescript`
- `pnpm exec rescript build`

  ## Scaffold-time checks
  - `python3 scripts/validate_scaffold.py`
  - `/nix/var/nix/profiles/default/bin/nix --extra-experimental-features 'nix-command flakes' flake lock`

  ## Current limitation
  - Bootstrap ReScript as a repo-local pnpm dependency.
