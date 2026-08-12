# Workstation Engineering Guidelines

## Purpose

This document defines the engineering methodology used to develop capabilities within the Workstation repository.

Configuration Management serves as the reference implementation for this methodology.

---

# Capability Lifecycle

Discovery

↓

Capability Contract

↓

Capability Review

↓

Operation Design

↓

Implementation

↓

Runtime Integration

↓

Validation

↓

Version 1 Complete

---

# Capability Principles

- One capability owns one responsibility.
- Capabilities expose operations.
- Operations own implementations.
- Runtime owns shared infrastructure.
- Capabilities communicate through inputs and outputs.
- Responsibilities are documented before implementation.
- Shared abstractions require multiple consumers.

---

# Development Rules

- Extract before refactor.
- Refactor before optimize.
- Complete one capability before starting another.
- Validate architecture before adding features.
- Every implementation must map back to a capability contract.

---

# Runtime Principles

Runtime owns:

- CLI parsing
- Logging
- Dry-run execution
- Shared traversal
- Shared execution behavior

Runtime never owns capability logic.

---

# Capability Completion Checklist

A capability is considered Version 1 Complete when:

- The capability contract is locked.
- Operations are documented.
- Implementation exists.
- Shared runtime integration exists.
- Structured output exists.
- Human-readable presentation exists.
- Tests validate expected behavior.
- Architecture and implementation agree.

Future enhancements belong to Version 2.

---

# Structured Data First

Capabilities produce structured data as their primary output.

Structured data is the canonical interface between capabilities.

Presentation is an adapter layered on top of structured data.

Capabilities should optimize for stable, machine-readable contracts rather than human presentation.

Human-readable output is produced through explicit rendering options such as:

- --pretty
- --table
- --markdown (future)

Structured outputs may include:

- JSON
- YAML (future)

This principle enables:

- deterministic automation
- stable capability interfaces
- reusable tooling
- independent presentation layers

---

# Capability Communication

Capabilities communicate through structured data streamed over standard output.

Capabilities consume structured data from standard input when appropriate.

Capabilities do not communicate through shared files or in-memory state unless explicitly required by the capability contract.

This follows the Unix philosophy of composing small, deterministic programs through pipelines.

---

## Capability Pipelines

Capabilities communicate through structured data streamed over standard output.

Capabilities consume structured data from standard input.

Capabilities should be composable through standard shell pipelines whenever practical.

The shell is the orchestration layer.

Capabilities remain independent.

This follows the Unix philosophy of building small, deterministic programs that cooperate through well-defined interfaces.

---

## Runtime Primitives vs Runtime Commands

Runtime Primitives are reusable shell functions.

They are intended to be sourced by Runtime and capabilities.

Runtime Commands are executable entry points.

They provide process-safe access to Runtime Primitives for subprocesses, pipelines, and external tools.

Runtime Commands should delegate to Runtime Primitives whenever practical.

Runtime Primitives should never invoke Runtime Commands.