# Shell Architecture

## Status

Active

---

# Purpose

The Shell Architecture defines how Workstation initializes an interactive shell.

It composes the Runtime SDK with shell-specific adapters to provide a consistent user experience.

The shell is responsible for exposing interactive workflows.

The Runtime is responsible for providing reusable infrastructure.

---

# Architecture

The interactive shell is composed from two independent layers.

```text
.profile

↓

shell/bash/init.sh

├──────────────────────┐
│                      │
▼                      ▼

Runtime                Shell

│                      │

runtime-interactive    shell-loader

│                      │

runtime-loader         Shell Adapters

│                      │

Runtime SDK            User Commands
```

The Runtime and Shell are peers.

Neither owns the other.

---

# Runtime

The Runtime provides reusable infrastructure.

Examples include:

- Environment
- XDG
- PATH
- Node
- History
- Terminal
- Prompt
- Navigation primitives
- Finder primitives
- Selector primitives
- Editor primitives

Runtime modules expose reusable functions.

They never expose interactive workflows.

Example:

```text
navigation_cd()

finder_directories()

selector_choose()
```

---

# Shell

The Shell provides interactive workflows.

Shell adapters compose Runtime primitives into user-facing commands.

Examples include:

```text
fd()

fda()

fe()

fh()
```

Shell adapters own:

- User interaction
- Workflow composition
- Interactive command behavior

Shell adapters never implement Runtime primitives.

---

# Initialization

Interactive shell initialization follows this sequence.

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

↓

shell-loader.sh

↓

Shell Adapters

↓

Interactive Prompt
```

Initialization order is intentional.

The Runtime is fully initialized before any shell adapters are loaded.

Shell adapters may assume Runtime services are available.

---

# Layer Responsibilities

## Runtime

Owns infrastructure.

Provides reusable services.

Never owns user interaction.

---

## Shell

Owns interactive workflows.

Provides commands intended for human users.

Never reimplements Runtime services.

---

## Runtime Primitives

Examples:

```text
navigation_cd

finder_directories

selector_choose

editor_open
```

These functions are intended to be reused by multiple shell adapters.

---

## Shell Adapters

Examples:

```text
fd

fda

fe

fh
```

Adapters compose Runtime primitives into complete interactive workflows.

---

# Design Principles

## Single Responsibility

Each Runtime module owns one responsibility.

Each Shell adapter owns one workflow.

---

## Composition

Shell adapters compose Runtime primitives.

Runtime primitives never depend upon Shell adapters.

Dependencies flow in one direction only.

```text
Shell

↓

Runtime

↓

Operating System
```

---

## Separation of Concerns

Infrastructure belongs to the Runtime.

Interactive behavior belongs to the Shell.

Application workflows belong to higher-level products.

Examples:

- Workstation
- Engineering Lab
- Image Lab

---

# Relationship to Workstation

The Shell is part of the Workstation platform.

It is not responsible for:

- Bootstrap
- Configuration Management
- Package Management
- Verification

Those capabilities consume the Runtime independently.

---

# Future Evolution

Additional shell adapters may be introduced without modifying the Runtime.

Examples:

```text
search.sh

editor.sh

aliases.sh
```

Each adapter composes existing Runtime primitives.

The Runtime SDK remains stable as additional workflows are introduced.

---

# Summary

The Shell Architecture separates infrastructure from interaction.

The Runtime provides reusable capabilities.

The Shell provides interactive workflows.

Together they form the interactive Workstation experience while preserving clear ownership boundaries and a modular architecture.