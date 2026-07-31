# Workstation Capabilities

## Purpose

Workstation is composed of independent capabilities.

Each capability owns a single constitutional responsibility.

Capabilities expose one or more operations that implement that responsibility.

Capabilities communicate through well-defined inputs and outputs rather than by sharing responsibilities.

Capabilities may depend upon lower-level capabilities, but they never assume another capability's responsibility.

Bootstrap orchestrates capabilities rather than implementing workstation functionality directly.

---

# Capability Types

Workstation capabilities fall into several architectural categories.

## Orchestration

Coordinates the execution of other capabilities.

- Bootstrap

## Discovery

Observes the execution environment and produces facts.

- Platform Detection

## Validation

Evaluates the current environment against defined requirements.

- Prerequisite Validation
- Verification

## Management

Creates or maintains workstation resources.

- Package Management
- Configuration Management

---

# Capability Hierarchy

## Bootstrap (Orchestrator)

Coordinates the execution of workstation capabilities.

Bootstrap owns workflow.

It does not implement workstation functionality directly.

Depends on:

- Platform Detection
- Prerequisite Validation
- Package Management
- Configuration Management
- Verification

---

## Platform Detection

Discovers the characteristics of the current execution environment.

Produces an environment description consumed by higher-level capabilities.

Operations:

- Detect

---

## Prerequisite Validation

Determines whether the current workstation satisfies the minimum requirements for Workstation.

Consumes the environment description produced by Platform Detection.

Operations:

- Validate

---

## Package Management

Installs and manages software packages required by Workstation.

Operations:

- Install
- Update
- Remove
- List

---

## Configuration Management

Maintains the desired workstation configuration.

Configuration Management is the reference capability implementation for the Workstation repository.

Operations:

- Deploy
- Remove
- Status
- Verify

Shared Concepts:

- Desired State
- Current State
- Configuration Manifest
- Configuration Objects

Shared Runtime:

- runtime.sh

---

## Verification

Confirms that the workstation matches the expected configuration after orchestration completes.

Verification consumes the outputs of lower-level capabilities.

It performs no deployment.

Operations:

- Verify

---

# Capability Principles

Every capability:

- Owns exactly one responsibility.
- Exposes one or more operations.
- Has a documented capability contract.
- Has a documented implementation.
- Produces well-defined outputs.
- Consumes well-defined inputs.
- May depend upon lower-level capabilities.
- Never owns another capability's responsibility.

---

# Capability Relationships

```text
Bootstrap
    │
    ▼
Platform Detection
    │
    ▼
Prerequisite Validation
    │
    ▼
Package Management
    │
    ▼
Configuration Management
    │
    ▼
Verification