# Platform Detection

**Status**

**Draft**

---

# Purpose

Platform Detection is responsible for discovering and reporting facts about the current execution environment required by other Workstation capabilities.

Platform Detection observes the environment.

It does not modify the environment.

---

# Responsibility

Discover and report intrinsic platform facts.

Platform Detection provides a normalized Platform Description that other capabilities consume.

> **Platform Detection discovers facts.**
>
> **It does not make decisions.**

---

# Owns

- Operating system detection
- Distribution detection
- Operating system version detection
- CPU architecture detection
- Shell detection
- User detection
- Home directory detection
- Platform Description generation

---

# Does Not Own

- Platform validation
- Package manager selection
- Package installation
- Configuration deployment
- Bootstrap orchestration
- Capability selection
- Environment modification

Those responsibilities belong to downstream capabilities.

---

# Inputs

Platform Detection requires no external inputs.

It observes the current execution environment.

---

# Outputs

Platform Detection produces a normalized Platform Description.

The Platform Description is the authoritative description of the execution environment.

Other capabilities consume the Platform Description rather than performing platform detection themselves.

---

# Platform Description

Version 1 produces the following information.

```json
{
  "platform": {
    "os": "macos",
    "distribution": "macos",
    "version": "15.7.7",
    "architecture": "arm64"
  },
  "environment": {
    "shell": "bash",
    "user": "brandonmorse",
    "home": "/Users/brandonmorse"
  },
  "warnings": []
}
```

The Platform Description is intentionally implementation-independent.

Consumers should rely on the contract rather than platform-specific detection logic.

---

# Operations

Platform Detection exposes one operation.

---

## Detect

Discover the characteristics of the current execution environment.

Produces a Platform Description.

The operation performs no validation.

---

# Dependencies

Platform Detection depends only upon:

- Shared Runtime
- The execution environment

Platform Detection intentionally has no dependency on any other Workstation capability.

---

# Success Criteria

Platform Detection is successful when:

- The execution environment has been observed.
- Platform Description has been produced.
- All discovered facts are reported accurately.
- Unknown values are explicitly reported rather than inferred.

---

# Failure Conditions

Platform Detection fails only when the execution environment cannot be observed.

Unknown platform characteristics are **not** considered failures.

Instead, they are reported as unknown.

---

# Uncertainty

Platform Detection never invents certainty.

When information cannot be determined, Platform Detection returns the best available information together with any relevant warnings.

Example:

```json
{
  "platform": {
    "os": "linux",
    "distribution": "unknown",
    "version": "unknown",
    "architecture": "x86_64"
  },
  "environment": {
    "shell": "bash",
    "user": "developer",
    "home": "/home/developer"
  },
  "warnings": [
    "Linux distribution could not be determined."
  ]
}
```

Reporting uncertainty is a successful outcome.

Evaluating whether that uncertainty is acceptable belongs to downstream capabilities.

---

# Version 1 Scope

Version 1 supports discovery of intrinsic platform characteristics only.

Version 1 intentionally excludes:

- Installed software
- Package managers
- Available tools
- Environment validation
- Capability recommendations
- Platform compatibility decisions

These responsibilities belong to other capabilities.

---

# Future

Potential future enhancements include:

- Hardware inventory
- Filesystem capabilities
- Network capabilities
- Virtualization detection
- Container detection
- Structured machine-readable output formats
- Confidence scoring