# Execution State

**Status**

**Draft**

---

# Purpose

Execution State is the transient working state of an orchestrated workflow.

It is assembled by an orchestrator from immutable Domain Artifacts produced by individual capabilities.

Execution State provides downstream capabilities with access to the information required to perform their responsibilities without violating capability ownership.

Execution State exists only for the lifetime of a workflow.

---

# Responsibility

Execution State represents the current known truth of an executing workflow.

It does not replace Domain Artifacts.

It composes them.

Execution State is owned by orchestration.

No capability owns Execution State.

---

# Ownership

Execution State is owned exclusively by the orchestrator.

Examples include:

- Bootstrap
- Engineering workflows
- Image processing pipelines
- Future MCU orchestration engines

Capabilities consume Execution State.

Capabilities never modify Execution State directly.

---

# Structure

Version 1 consists of the following sections.

```json
{
  "schema": "execution-state/v1",

  "platform": null,

  "validation": null,

  "packages": null,

  "configuration": null,

  "verification": null
}
```

Each property references a Domain Artifact.

Execution State does not redefine or duplicate those artifacts.

---

# Composition

Execution State grows as workflow execution progresses.

Initially:

```json
{
  "schema": "execution-state/v1"
}
```

After Platform Detection:

```json
{
  "schema": "execution-state/v1",

  "platform": {
    ...
  }
}
```

After Prerequisite Validation:

```json
{
  "schema": "execution-state/v1",

  "platform": {
    ...
  },

  "validation": {
    ...
  }
}
```

After Package Management:

```json
{
  "schema": "execution-state/v1",

  "platform": {
    ...
  },

  "validation": {
    ...
  },

  "packages": {
    ...
  }
}
```

Execution continues until every participating capability has contributed its Domain Artifact.

---

# Lifecycle

Execution State is created by an orchestrator.

It is progressively composed during execution.

It is discarded when orchestration completes.

Execution State is intentionally transient.

Persistent information remains within the Domain Artifacts produced by individual capabilities.

---

# Relationship to Domain Artifacts

Execution State contains references to Domain Artifacts.

Execution State never modifies them.

Each Domain Artifact remains owned by the capability that produced it.

Examples:

- Platform Description
- Validation Report
- Package Plan
- Configuration State
- Verification Report

---

# Relationship to Capabilities

Capabilities produce Domain Artifacts.

Capabilities consume Execution State.

Capabilities never enrich another capability's Domain Artifact.

Capabilities never own Execution State.

---

# Version 1 Scope

Version 1 supports the following workflow.

Platform Detection

↓

Platform Description

↓

Prerequisite Validation

↓

Validation Report

↓

Package Management

↓

Package Plan

↓

Configuration Management

↓

Configuration State

↓

Verification

↓

Verification Report

Execution State grows as each capability completes.

---

# Future

Future versions may include:

- execution timestamps
- workflow metadata
- execution identifiers
- rollback state
- orchestration metrics

These additions remain orchestration concerns.

They do not alter capability ownership.