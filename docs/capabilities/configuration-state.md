# Configuration State

**Status**

**Draft**

---

# Purpose

Configuration State describes the outcome of Configuration Management.

It records the configuration operations that were planned or executed during workstation orchestration.

Configuration State is the Domain Artifact produced by Configuration Management.

---

# Constitutional Responsibility

Configuration Management owns Configuration State.

Bootstrap composes Configuration State into the current Execution State.

Configuration State never describes platform detection, package management, or verification.

---

# Ownership

Produced by:

- Configuration Management

Consumed by:

- Bootstrap
- Verification
- Future reporting capabilities

---

# Operations

Configuration State records configuration operations.

Examples include:

- link
- unlink
- create
- remove
- update

Additional operations may be introduced without changing the artifact contract.

---

# Schema

```json
{
  "schema": "configuration-state/v1",

  "mode": "dry-run",

  "operations": [
    {
      "action": "link",
      "source": "/Users/brandonmorse/Sites/personal/workstation/config/.gitconfig",
      "target": "/Users/brandonmorse/.gitconfig",
      "status": "planned"
    }
  ],

  "warnings": []
}
```

---

# Modes

Configuration State supports multiple execution modes.

## Dry Run

No filesystem changes occur.

Operations describe the work that would be performed.

Example:

```json
{
  "mode": "dry-run"
}
```

---

## Apply

Filesystem changes have been performed.

Operations describe the completed work.

Example:

```json
{
  "mode": "apply"
}
```

---

# Operation Status

Operations may report one of the following states.

| Status | Meaning |
|---------|---------|
| planned | Operation has been planned but not executed. |
| completed | Operation completed successfully. |
| skipped | Operation was not required. |
| failed | Operation failed. |

---

# Relationship to Execution State

Bootstrap composes Configuration State into Execution State.

Example:

```text
Execution State

├── platform
├── validation
├── packages
├── package_result
└── configuration
```

Configuration State is never modified after it is produced.

---

# Relationship to Bootstrap

Bootstrap invokes Configuration Management.

Configuration Management produces Configuration State.

Bootstrap composes Configuration State into the current Execution State.

Bootstrap never interprets configuration operations.

---

# Version 1

Version 1 supports:

- dry-run deployment
- symbolic link planning
- operation reporting

---

# Future

Future versions may support:

- rollback
- conflict detection
- backups
- permissions
- ownership
- templating
- profile selection

These enhancements extend Configuration Management without changing the Configuration State contract.