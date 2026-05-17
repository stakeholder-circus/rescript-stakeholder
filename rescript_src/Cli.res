@scope("console") @val external log: string => unit = "log"
@scope("console") @val external error: string => unit = "error"
@scope("JSON") @val external stringifyString: string => string = "stringify"
@scope("process") @val external argv: array<string> = "argv"
@scope("process") @val external exit: int => 'a = "exit"

let classicFamilies = [
  "code-analyzer",
  "data-processing",
  "jargon",
  "metrics",
  "network-activity",
  "system-monitoring",
]

let modernCoreFamilies = [
  "agent-workflows",
  "platform-engineering",
  "observability-ai-runtime",
  "delivery-preview-ops",
  "supply-chain-security",
]

let fallbackFamilies = [
  "ai-inference-ops",
  "evaluation-and-guardrails",
  "knowledge-retrieval",
  "edge-client-runtime",
  "identity-and-trust",
  "aibom-provenance",
  "agent-boundary-security",
  "embedded-agentic-pipeline",
  "data-governance-compliance",
  "finops-capacity",
  "blockchain-protocol-ops",
  "cross-chain-interop",
  "proof-and-sequencer-ops",
  "hybrid-runtime-ops",
  "capacity-cost-controller",
  "batch-execution-tuner",
  "compiler-maintainer",
  "interop-adapter-engineer",
  "preflight-capacity-planner",
  "simulator-performance-engineer",
  "fhir-profile-generator",
  "smart-launch-oauth",
  "bulk-fhir-population-ops",
  "hl7v2-feed-ops",
  "clinical-workflow-events",
  "dicomweb-imaging-ops",
  "openehr-semantic-record-ops",
  "device-telemetry-clinical",
  "emr-vendor-adapter",
  "ocpp-chargepoint-ops",
  "ocpi-roaming-ops",
  "mcp-a2a-ops",
  "streaming-bus-ops",
  "service-mesh-rpc-ops",
]

let allFamilies = Belt.Array.concatMany([classicFamilies, modernCoreFamilies, fallbackFamilies])

type descriptor = {
  family: string,
  title: string,
  protocol: option<string>,
  schemaName: option<string>,
  schemaVersion: option<string>,
  low: string,
  high: string,
  extreme: string,
  parityClass: string,
}

type config = {
  outputFormat: string,
  focusFamily: option<string>,
  seed: int,
  project: string,
  devType: string,
  jargon: string,
  complexity: string,
  framework: string,
  alerts: bool,
  team: bool,
  trace: bool,
}

let usage = "rescript-stakeholder [--list-values] [--focus-family FAMILY] [--output-format text|json] [--seed N] [--experimental-provider PROVIDER]"

let quote = value => stringifyString(value)

let stringArrayJson = values =>
  "[" ++ values->Belt.Array.joinWith(",", quote) ++ "]"

let has = (values, needle) => values->Belt.Array.some(value => value == needle)

let fail = (message, code) => {
  error(message)
  exit(code)
}

let readValue = (args, index, flag) =>
  switch args->Belt.Array.get(index + 1) {
  | Some(value) if !String.startsWith(value, "--") => value
  | _ => fail("missing value for " ++ flag ++ "\n" ++ usage, 2)
  }

let parseIntOr = (value, fallback) =>
  switch Int.fromString(value) {
  | Some(parsed) => parsed
  | None => fallback
  }

let rec parseArgs = (args, index, config, listValues) =>
  if index >= args->Belt.Array.length {
    (config, listValues)
  } else {
    switch args->Belt.Array.get(index) {
    | None => (config, listValues)
    | Some(arg) =>
    switch arg {
    | "--list-values" => parseArgs(args, index + 1, config, true)
    | "--focus-family" => {
        let value = readValue(args, index, arg)
        parseArgs(args, index + 2, {...config, focusFamily: Some(value)}, listValues)
      }
    | "--output-format" => {
        let value = readValue(args, index, arg)
        if value != "text" && value != "json" {
          fail("unsupported --output-format: " ++ value, 2)
        }
        parseArgs(args, index + 2, {...config, outputFormat: value}, listValues)
      }
    | "--seed" => {
        let value = readValue(args, index, arg)
        parseArgs(args, index + 2, {...config, seed: parseIntOr(value, config.seed)}, listValues)
      }
    | "--project" | "-p" => {
        let value = readValue(args, index, arg)
        parseArgs(args, index + 2, {...config, project: value}, listValues)
      }
    | "--dev-type" | "-d" => {
        let value = readValue(args, index, arg)
        parseArgs(args, index + 2, {...config, devType: value}, listValues)
      }
    | "--jargon" | "-j" => {
        let value = readValue(args, index, arg)
        parseArgs(args, index + 2, {...config, jargon: value}, listValues)
      }
    | "--complexity" | "-c" => {
        let value = readValue(args, index, arg)
        parseArgs(args, index + 2, {...config, complexity: value}, listValues)
      }
    | "--framework" | "-F" => {
        let value = readValue(args, index, arg)
        parseArgs(args, index + 2, {...config, framework: value}, listValues)
      }
    | "--alerts" | "-a" => parseArgs(args, index + 1, {...config, alerts: true}, listValues)
    | "--team" | "-t" => parseArgs(args, index + 1, {...config, team: true}, listValues)
    | "--trace" => parseArgs(args, index + 1, {...config, trace: true}, listValues)
    | "--duration" | "-T" | "--minimal" | "--no-color" =>
        if arg == "--duration" || arg == "-T" {
          let _ = readValue(args, index, arg)
          parseArgs(args, index + 2, config, listValues)
        } else {
          parseArgs(args, index + 1, config, listValues)
        }
    | "--experimental-provider" => {
        let provider = readValue(args, index, arg)
        fail("experimental provider '" ++ provider ++ "' is not implemented in Tranche D; deterministic mode is the only supported runtime. gap=rescript-stakeholder.experimental-provider-deferred", 2)
      }
    | value if String.startsWith(value, "--experimental-") =>
        fail("experimental flags require --experimental-provider. gap=rescript-stakeholder.experimental-provider-deferred", 2)
    | "--help" | "-h" => {
        log(usage)
        exit(0)
      }
    | value => fail("unknown argument: " ++ value ++ "\n" ++ usage, 2)
    }
    }
  }

let descriptor = family =>
  switch family {
  | "code-analyzer" => {family, title: "Code analyzer", protocol: None, schemaName: None, schemaVersion: None, low: "scanning source modules for reviewable complexity and dependency movement", high: "correlating AST drift, generated bindings, and review hotspots across the active tree", extreme: "normalizing static-analysis evidence into traceable rewrite risks before parity handoff", parityClass: "classic-six"}
  | "data-processing" => {family, title: "Data processing", protocol: None, schemaName: Some("data-pipeline-event"), schemaVersion: Some("2026-04"), low: "batching records through deterministic transforms and stable output ordering", high: "checking replay-safe aggregation, schema drift, and partition pressure", extreme: "pinning normalized data streams so seeded parity fixtures remain byte-stable", parityClass: "classic-six"}
  | "jargon" => {family, title: "Jargon refresh", protocol: None, schemaName: None, schemaVersion: None, low: "keeping technical language current without drifting into fake-deep jargon", high: "switching phrasing toward credible 2026 agent, platform, protocol, and security terminology", extreme: "enforcing modern domain vocabulary so advanced output stays precise instead of synthetic", parityClass: "classic-six"}
  | "metrics" => {family, title: "Metrics", protocol: None, schemaName: None, schemaVersion: None, low: "tracking queue depth, latency bands, and cost signals across the active workload", high: "correlating token spend, SLO burn, runner pressure, and attestation coverage", extreme: "folding evaluation score movement and runner economics into one operations dashboard", parityClass: "classic-six"}
  | "network-activity" => {family, title: "Network activity", protocol: Some("grpc"), schemaName: None, schemaVersion: None, low: "observing RPC, event-stream, and adapter traffic across the current service boundary", high: "mapping MCP calls, inference APIs, registry fetches, and cross-domain message flow", extreme: "profiling mixed gRPC, Kafka, MQTT, and bridge traffic while preserving replay semantics", parityClass: "classic-six"}
  | "system-monitoring" => {family, title: "System monitoring", protocol: None, schemaName: None, schemaVersion: None, low: "watching collector pressure, runner health, and process saturation on the active stack", high: "capturing GPU memory pressure, secret-scan spikes, sandbox failures, and scheduler churn", extreme: "stitching host telemetry, proof queues, provisioning lag, and policy denials into one heartbeat", parityClass: "classic-six"}
  | "agent-workflows" => {family, title: "Agent workflows", protocol: Some("mcp"), schemaName: Some("agent-workflow-envelope"), schemaVersion: Some("2026-04"), low: "routing coding-agent work through review queues and approval gates", high: "coordinating delegated patch runs, blocked tool calls, and human checkpoints across repos", extreme: "orchestrating branch handoff envelopes, MCP leases, and merge-safe approval chains", parityClass: "modern-core"}
  | "platform-engineering" => {family, title: "Platform engineering", protocol: None, schemaName: None, schemaVersion: None, low: "maintaining golden paths, service templates, and workload identity", high: "resolving platform policy denials, tenant quotas, and template drift", extreme: "reconciling workload identity, cluster tenancy, policy bundles, and queue fairness", parityClass: "modern-core"}
  | "observability-ai-runtime" => {family, title: "Observability AI runtime", protocol: None, schemaName: Some("otel-runtime-event"), schemaVersion: Some("2026-04"), low: "recording traces, token spend, and latency bands for the active runtime", high: "tracking OTel collector saturation, span cardinality, and GPU telemetry alongside tool-call traces", extreme: "driving burn-rate analysis across inference queues, cost attribution, and distributed reasoning spans", parityClass: "modern-core"}
  | "delivery-preview-ops" => {family, title: "Delivery preview ops", protocol: None, schemaName: None, schemaVersion: None, low: "managing preview environments, feature flags, and canary promotions", high: "holding rollout gates on runner saturation, preview drift, and canary health regressions", extreme: "sequencing flag freezes, rollback windows, and staged promotion rules across agent-authored pipelines", parityClass: "modern-core"}
  | "supply-chain-security" => {family, title: "Supply-chain security", protocol: None, schemaName: Some("provenance-check"), schemaVersion: Some("2026-04"), low: "checking artifact trust, secret exposure, and dependency health before release", high: "verifying provenance attestations, AIBOM coverage, revocation posture, and tamper signals", extreme: "gating release promotion on signed artifacts, dependency substitution checks, and cross-tool trust evidence", parityClass: "modern-core"}
  | other => {family: other, title: "Grouped fallback", protocol: None, schemaName: Some("grouped-fallback-event"), schemaVersion: Some("2026-04"), low: "holding later-family behavior behind an explicit grouped fallback", high: "recording deferred family coverage without silent parity claims", extreme: "failing closed on dedicated semantics while preserving deterministic normalized output", parityClass: "grouped-fallback"}
  }

let messageFor = (descriptor, jargon) =>
  switch jargon {
  | "high" => descriptor.high
  | "extreme" => descriptor.extreme
  | _ => descriptor.low
  }

let padSix = value => {
  switch String.length(value) {
  | 0 => "000000"
  | 1 => "00000" ++ value
  | 2 => "0000" ++ value
  | 3 => "000" ++ value
  | 4 => "00" ++ value
  | 5 => "0" ++ value
  | _ => value
  }
}

let timestamp = sequence => "T+" ++ padSix((sequence * 137)->Int.toString) ++ "ms"

let nextSeed = seed => mod(seed * 1103515245 + 12345, 2147483647)

let choose = (values, seed) =>
  switch values->Belt.Array.get(mod(seed, values->Belt.Array.length)) {
  | Some(value) => value
  | None => fail("internal family selection failed", 2)
  }

let complexityCount = complexity =>
  switch complexity {
  | "low" => 1
  | "high" => 3
  | "extreme" => 4
  | _ => 2
  }

let selectedFamilies = config =>
  switch config.focusFamily {
  | Some(family) =>
      if has(allFamilies, family) {
        [family]
      } else {
        fail("unsupported --focus-family: " ++ family, 2)
      }
  | None => {
      let seed1 = nextSeed(config.seed)
      let seed2 = nextSeed(seed1)
      let base = [choose(classicFamilies, seed1), choose(modernCoreFamilies, seed2)]
      let count = complexityCount(config.complexity)
      if count <= 2 {
        base
      } else if count == 3 {
        Belt.Array.concat(base, [choose(classicFamilies, nextSeed(seed2))])
      } else {
        Belt.Array.concat(base, [choose(classicFamilies, nextSeed(seed2)), choose(modernCoreFamilies, nextSeed(nextSeed(seed2)))])
      }
    }
  }

let schemaJson = descriptor =>
  switch (descriptor.schemaName, descriptor.schemaVersion) {
  | (Some(name), Some(version)) => "{\"name\":" ++ quote(name) ++ ",\"version\":" ++ quote(version) ++ "}"
  | _ => "null"
  }

let protocolJson = descriptor =>
  switch descriptor.protocol {
  | Some(protocol) => quote(protocol)
  | None => "null"
  }

let eventJson = (eventType, sequence, message, family, descriptor, config) => {
  let familyJson = switch family { | Some(value) => quote(value) | None => "null" }
  "{"
  ++ "\"eventType\":" ++ quote(eventType)
  ++ ",\"sequence\":" ++ sequence->Int.toString
  ++ ",\"timestamp\":" ++ quote(timestamp(sequence))
  ++ ",\"message\":" ++ quote(message)
  ++ ",\"family\":" ++ familyJson
  ++ ",\"protocol\":" ++ protocolJson(descriptor)
  ++ ",\"schemaRef\":" ++ schemaJson(descriptor)
  ++ ",\"flavors\":[]"
  ++ ",\"generationProvenance\":{\"sourceRepo\":\"rust-stakeholder\",\"baseline\":\"tranche-d-deterministic-first\",\"experimental\":false,\"adapterType\":\"rescript-static-catalog\",\"promptVersion\":null}"
  ++ ",\"context\":{\"project\":" ++ quote(config.project) ++ ",\"devType\":" ++ quote(config.devType) ++ ",\"jargon\":" ++ quote(config.jargon) ++ ",\"parityClass\":" ++ quote(descriptor.parityClass) ++ ",\"seed\":" ++ quote(config.seed->Int.toString) ++ "}"
  ++ "}"
}

let renderEvent = (config, eventType, sequence, message, family, descriptor) =>
  if config.outputFormat == "json" {
    log(eventJson(eventType, sequence, message, family, descriptor, config))
  } else {
    switch family {
    | Some(value) => log("[" ++ descriptor.title ++ "] " ++ value ++ ": " ++ message)
    | None => log(message)
    }
  }

let renderListValues = () =>
  log("{"
  ++ "\"devTypes\":" ++ stringArrayJson(["backend", "frontend", "fullstack", "data_science", "dev_ops", "blockchain", "machine_learning", "systems_programming", "game_development", "security"])
  ++ ",\"jargonLevels\":" ++ stringArrayJson(["low", "medium", "high", "extreme"])
  ++ ",\"complexities\":" ++ stringArrayJson(["low", "medium", "high", "extreme"])
  ++ ",\"outputFormats\":" ++ stringArrayJson(["text", "json"])
  ++ ",\"flags\":" ++ stringArrayJson(["list-values", "focus-family", "output-format", "seed", "experimental-provider", "project", "dev-type", "jargon", "complexity", "framework", "alerts", "team", "trace"])
  ++ ",\"experimentalProviders\":" ++ stringArrayJson(["openai-compatible-api", "anthropic-api", "openai-consumer", "claude-consumer"])
  ++ ",\"dedicatedFamilies\":" ++ stringArrayJson(Belt.Array.concat(classicFamilies, modernCoreFamilies))
  ++ ",\"groupedFallbackFamilies\":" ++ stringArrayJson(fallbackFamilies)
  ++ ",\"generatorFamilies\":" ++ stringArrayJson(allFamilies)
  ++ "}")

let defaultConfig = {
  outputFormat: "text",
  focusFamily: None,
  seed: 1,
  project: "distributed-cluster",
  devType: "backend",
  jargon: "medium",
  complexity: "medium",
  framework: "",
  alerts: false,
  team: false,
  trace: false,
}

let args = argv->Belt.Array.slice(~offset=2, ~len=argv->Belt.Array.length - 2)
let (config, listValues) = parseArgs(args, 0, defaultConfig, false)

if listValues {
  renderListValues()
} else {
  let sessionDescriptor = {family: "session", title: "Session", protocol: None, schemaName: None, schemaVersion: None, low: "", high: "", extreme: "", parityClass: "session"}
  renderEvent(config, "session.start", 1, "starting Tranche D deterministic ReScript session for " ++ config.project, None, sessionDescriptor)
  selectedFamilies(config)->Belt.Array.forEachWithIndex((index, family) => {
    let item = descriptor(family)
    renderEvent(config, "activity", index + 2, messageFor(item, config.jargon), Some(family), item)
    if config.trace {
      renderEvent(config, "trace", index + 102, "scheduled " ++ family ++ " as " ++ item.parityClass, Some(family), item)
    }
  })
  renderEvent(config, "session.end", 999, "session terminated (deterministic-cycle-complete)", None, sessionDescriptor)
}
