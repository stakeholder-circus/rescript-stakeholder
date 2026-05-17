# First-push families for rescript-stakeholder

| Family | Tranche D status | Source anchor | Target anchor | Parity classification |
| --- | --- | --- | --- | --- |
| `code-analyzer` | implemented | `rust-stakeholder/src/generators/code_analyzer.rs` | `rescript_src/Cli.res` | dedicated classic-six |
| `data-processing` | implemented | `rust-stakeholder/src/generators/data_processing.rs` | `rescript_src/Cli.res` | dedicated classic-six |
| `jargon` | implemented | `rust-stakeholder/src/generators/jargon.rs` | `rescript_src/Cli.res` | dedicated classic-six |
| `metrics` | implemented | `rust-stakeholder/src/generators/metrics.rs` | `rescript_src/Cli.res` | dedicated classic-six |
| `network-activity` | implemented | `rust-stakeholder/src/generators/network_activity.rs` | `rescript_src/Cli.res` | dedicated classic-six |
| `system-monitoring` | implemented | `rust-stakeholder/src/generators/system_monitoring.rs` | `rescript_src/Cli.res` | dedicated classic-six |
| `agent-workflows` | implemented | `rust-stakeholder/src/generators/agent_workflows.rs` | `rescript_src/Cli.res` | dedicated modern-core |
| `platform-engineering` | implemented | `rust-stakeholder/src/generators/platform_engineering.rs` | `rescript_src/Cli.res` | dedicated modern-core |
| `observability-ai-runtime` | implemented | `rust-stakeholder/src/generators/observability_ai_runtime.rs` | `rescript_src/Cli.res` | dedicated modern-core |
| `delivery-preview-ops` | implemented | `rust-stakeholder/src/generators/delivery_preview_ops.rs` | `rescript_src/Cli.res` | dedicated modern-core |
| `supply-chain-security` | implemented | `rust-stakeholder/src/generators/supply_chain_security.rs` | `rescript_src/Cli.res` | dedicated modern-core |
| later families | grouped fallback | `rust-stakeholder/src/generators/*` | `rescript_src/Cli.res` | deterministic grouped fallback |
