# Prerequisite Validation

**Status**

**Draft**

---

# Purpose

Prerequisite Validation is responsible for evaluating whether the current execution environment satisfies the minimum requirements necessary for Workstation.

Prerequisite Validation consumes a Platform Description and produces a Validation Report.

It evaluates the environment.

It does not modify the environment.

---

# Responsibility

Evaluate the current execution environment against the Workstation support policy.

Prerequisite Validation determines whether the detected platform is supported.

> **Prerequisite Validation evaluates facts.**
>
> **It does not discover facts or make installation decisions.**

---

# Owns

- Platform support evaluation
- Validation rule execution
- Validation Report generation
- Validation warnings
- Validation errors

---

# Does Not Own

- Platform detection
- Package installation
- Bootstrap orchestration
- Configuration deployment
- Environment modification
- Capability selection

Those responsibilities belong to other capabilities.

---

# Inputs

Prerequisite Validation consumes a Platform Description.

The Platform Description is produced by Platform Detection.

Version 1 accepts Platform Description JSON via standard input.

---

# Outputs

Prerequisite Validation produces a Validation Report.

The Validation Report is the authoritative description of whether the current platform satisfies the minimum Workstation requirements.

Downstream capabilities consume the Validation Report rather than performing their own validation.

---

# Validation Report

The Validation Report is the authoritative result of evaluating a Platform Description against the Workstation support policy.

It communicates whether the current execution environment satisfies the minimum requirements required by downstream capabilities.

The Validation Report is the canonical output of Prerequisite Validation.

Downstream capabilities consume the Validation Report rather than performing their own prerequisite evaluation.

---

## Version 1 Structure

```json
{
  "schema": "validation-report/v1",
  "supported": true,
  "errors": [],
  "warnings": []
}
```

---

## Fields

### schema

Identifies the Validation Report schema.

Example:

```text
validation-report/v1
```

---

### supported

Indicates whether the supplied Platform Description satisfies the Version 1 support policy.

Possible values:

- true
- false

---

### errors

A list of conditions that prevent Workstation from continuing.

Errors indicate unsupported or invalid environments.

Version 1 examples include:

- Unsupported operating system
- Unsupported CPU architecture

---

### warnings

A list of non-fatal observations.

Warnings do not prevent execution.

Version 1 may legitimately produce an empty list.

---

# Operations

Prerequisite Validation exposes one operation.

---

## Validate

Evaluate the supplied Platform Description.

Produce a Validation Report.

The operation performs no discovery.

The operation performs no installation.

---

# Dependencies

Prerequisite Validation depends upon:

- Shared Runtime
- Platform Description

Prerequisite Validation intentionally has no dependency on Package Management, Configuration Management, or Bootstrap.

---

# Success Criteria

Prerequisite Validation is successful when:

- The Platform Description is successfully evaluated.
- A Validation Report is produced.
- Every validation rule is evaluated.
- Unsupported platforms are explicitly reported.

---

# Failure Conditions

Prerequisite Validation fails only when the supplied Platform Description cannot be evaluated.

An unsupported platform is **not** considered a failure.

Unsupported platforms are valid validation outcomes.

---

# Validation Policy

Version 1 evaluates only intrinsic platform characteristics.

Validation is intentionally conservative.

The goal of Version 1 is to validate the capability pipeline rather than provide exhaustive workstation validation.

---

## Supported Platforms

Operating System

- macOS

CPU Architecture

- arm64

---

## Unsupported Platforms

Version 1 reports the following as unsupported:

- Non-macOS operating systems
- Non-arm64 architectures

Unsupported platforms are valid validation outcomes.

They are not execution failures.

---

## Evaluation Rules

Each rule produces one of the following outcomes:

- Pass
- Warning
- Error

Version 1 defines only Pass and Error outcomes.

Warnings are reserved for future versions.

---

## Result

The Validation Report is produced by evaluating every Version 1 rule.

If every rule passes:

```json
{
  "supported": true,
  "errors": [],
  "warnings": []
}
```

If one or more rules fail:

```json
{
  "supported": false,
  "errors": [
    "Unsupported operating system."
  ],
  "warnings": []
}
```

# Version 1 Scope

Version 1 exists to validate the capability pipeline between:

Platform Detection

↓

Platform Description

↓

Prerequisite Validation

↓

Validation Report

It intentionally implements only the minimum rule set required to validate the architecture.

---

# Future

Potential future enhancements include:

- Operating system version validation
- Distribution-specific validation
- Package manager validation
- Required tool validation
- Filesystem validation
- Network validation
- Configurable validation policies
- Machine-readable validation rule definitions