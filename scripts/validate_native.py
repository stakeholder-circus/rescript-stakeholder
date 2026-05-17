from pathlib import Path
import subprocess
import sys

required = [
    'README.md', 'AI_DISCLOSURE.md', 'PARITY.md', 'GAPS.md', 'AGENTS.md',
    'docs/remotes.md', 'docs/provenance.md', 'docs/toolchain.md',
    'docs/traceability/first-push-families.md', '.githooks/commit-msg',
    '.githooks/pre-push', '.github/CODEOWNERS', '.github/PULL_REQUEST_TEMPLATE.md',
    '.github/dependabot.yml', '.github/workflows/actionlint.yml',
    '.github/workflows/dependency-review.yml', '.github/workflows/ci.yml',
    '.github/workflows/ci-native.yml', '.github/workflows/docker-smoke.yml',
    'flake.nix', 'Dockerfile', 'flake.lock', 'package.json', 'rescript.json',
    'rescript_src/Cli.res', 'tests/native_validation.mjs', 'LICENSE',
]
missing = [p for p in required if not Path(p).exists()]
if missing:
    raise SystemExit('missing native files: ' + ', '.join(missing))
if 'Copyright (c) 2025 giacomo-b' not in Path('LICENSE').read_text():
    raise SystemExit('MIT license notice was not preserved')
for command in (['pnpm', 'exec', 'rescript', 'build'], ['pnpm', 'test']):
    subprocess.run(command, check=True)
print('native validation passed')
