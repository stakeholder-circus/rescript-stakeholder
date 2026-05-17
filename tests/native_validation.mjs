import { execFileSync, spawnSync } from 'node:child_process';

const node = process.execPath;
const cli = 'lib/es6/rescript_src/Cli.mjs';
const run = (args) => execFileSync(node, [cli, ...args], { encoding: 'utf8' });

JSON.parse(run(['--list-values']));
const first = run(['--output-format', 'json', '--seed', '42', '--focus-family', 'agent-workflows']);
const second = run(['--output-format', 'json', '--seed', '42', '--focus-family', 'agent-workflows']);
if (first !== second) throw new Error('same-seed JSON output changed between runs');
if (!first.includes('"family":"agent-workflows"')) throw new Error('focused family missing from JSON output');
if (!first.includes('"baseline":"tranche-d-deterministic-first"')) throw new Error('provenance baseline missing');
const fallback = run(['--output-format', 'json', '--seed', '7', '--focus-family', 'mcp-a2a-ops']);
if (!fallback.includes('"parityClass":"grouped-fallback"')) throw new Error('later family did not use grouped fallback');
const text = run(['--seed', '5', '--focus-family', 'code-analyzer']);
if (!text.includes('[Code analyzer]')) throw new Error('text output did not render dedicated family title');
const experimental = spawnSync(node, [cli, '--experimental-provider', 'openai-compatible-api'], { encoding: 'utf8' });
if (experimental.status === 0) throw new Error('experimental provider did not fail fast');
if (!experimental.stderr.includes('experimental provider')) throw new Error('experimental provider diagnostic missing');
console.log('native deterministic validation passed');
