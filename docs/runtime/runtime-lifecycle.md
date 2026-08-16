# Runtime Lifecycle

## Status

Draft

---

# Purpose

The Runtime Lifecycle defines how the Workstation Runtime is loaded, initialized, and made available to interactive shells and Workstation capabilities.

The Runtime is a shared platform service.

It is not a capability.

It is not an orchestrator.

It is infrastructure.

---

# Architecture

The Runtime consists of three layers.

```text
Bootstrap

↓

Loader

↓

Runtime SDK
```

Each layer has a single responsibility.

---

# Runtime Bootstraps

Two Runtime bootstraps exist.

## Interactive Runtime

```text
.profile

↓

shell/bash/init.sh

↓

runtime-interactive.sh

↓

runtime-loader.sh

↓

Runtime SDK
```

The Interactive Runtime prepares the shell environment.

Responsibilities include:

- Runtime initialization
- Environment preparation
- Shell configuration

The Interactive Runtime never executes Workstation capabilities.

---

## CLI Runtime

```text
bin/workstation

↓

runtime.sh

↓

runtime-loader.sh

↓

Runtime SDK
```

The CLI Runtime prepares the Runtime for capability execution.

Responsibilities include:

- Runtime loading
- CLI option parsing
- Command execution
- Capability support

The CLI Runtime never configures the interactive shell.

---

# Runtime Loader

The Runtime Loader is responsible only for loading Runtime modules.

The Runtime Loader never performs initialization.

Responsibilities include:

- Source Runtime modules
- Source Runtime orchestration helpers
- Construct the Runtime SDK

The Runtime Loader never:

- Executes initialization
- Parses CLI options
- Configures the shell

---

# Runtime SDK

The Runtime SDK exposes reusable Runtime services.

Current Runtime modules include:

- Environment
- XDG
- PATH
- Node
- History
- Shell
- Aliases
- Terminal
- Prompt
- Configuration
- Catalog
- Platform
- Navigation
- Finder
- Selector
- Editor
- Preview

Runtime modules own responsibilities.

Runtime modules never own orchestration.

---

# Runtime Initialization

Interactive Runtime initialization follows this sequence.

```text
Homebrew

↓

XDG

↓

Environment

↓

PATH

↓

Node

↓

History

↓

Shell

↓

Aliases

↓

Terminal

↓

Prompt
```

Initialization order reflects dependency order.

Earlier stages establish prerequisites required by later stages.

---

# Design Principles

The Runtime follows these principles.

## Single Responsibility

Each Runtime module owns exactly one responsibility.

---

## Loader vs Initializer

Loading and initialization are separate concerns.

The Runtime Loader loads.

The Runtime Bootstrap initializes.

---

## Shared Runtime

Interactive shells and Workstation capabilities share the same Runtime SDK.

Different bootstraps initialize the Runtime for different execution environments.

---

## Infrastructure First

The Runtime provides infrastructure.

Capabilities provide business logic.

Orchestrators provide workflow.

---

# Relationship to Workstation

The Runtime is a platform service used by Workstation.

Workstation capabilities depend upon the Runtime.

The Runtime does not depend upon Workstation capabilities.

---

# Future Evolution

Future Runtime modules may be introduced without changing the Runtime Lifecycle.

New modules participate by:

1. Being loaded by the Runtime Loader.
2. Being initialized by the appropriate Runtime Bootstrap.

The Runtime Lifecycle remains stable as the Runtime SDK evolves.
