# Workstation State

**Status**

**Draft**

---

# Purpose

Workstation State describes the current known state of a workstation after orchestration has completed.

It summarizes the outcome of all executed capabilities.

Workstation State is produced by orchestrators.

Capabilities never produce Workstation State.

---

# Responsibility

Workstation State provides a durable summary of workstation provisioning.

It records:

- execution success
- composed Execution State
- orchestration summary
- warnings
- failures

It does not replace Execution State.

Execution State is transient.

Workstation State is persistent.

---

# Ownership

Produced by:

- Bootstrap
- Future orchestrators

Consumed by:

- Verification
- Reporting
- Future repair workflows

---

# Schema

```json
{
  "schema": "workstation-state/v1",

  "success": true,

  "execution": {
    ...
  },

  "summary": {
    "packages": 4,
    "configuration": 1,
    "warnings": 0,
    "errors": 0
  }
}
```

---

# Relationship to Execution State

Execution State exists only while orchestration is executing.

Workstation State represents the completed outcome of orchestration.

Execution State is transient.

Workstation State is durable.

---

# Version 1

Version 1 records:

- Execution State
- success
- summary

Future versions may include:

- timestamps
- duration
- version information
- rollback metadata