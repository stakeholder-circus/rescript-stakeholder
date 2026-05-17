from pathlib import Path
required = ['package.json', 'rescript.json', 'rescript_src/Cli.res', 'tests/native_validation.mjs', 'scripts/validate_native.py', 'README.md', 'PARITY.md', 'GAPS.md', 'STATUS.md', 'docs/toolchain.md', 'docs/traceability/first-push-families.md', 'Dockerfile', 'flake.nix', 'LICENSE']
missing = [p for p in required if not Path(p).exists()]
if missing:
    raise SystemExit('missing ReScript runtime files: ' + ', '.join(missing))
print('rescript runtime scaffold validated')
