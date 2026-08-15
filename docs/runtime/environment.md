# Runtime Environment

**Status**

Draft

---

# Purpose

The Runtime Environment initializes the shell execution environment required by Workstation.

It is responsible for preparing the operating environment before Runtime services, capabilities, or Engineering Lab extensions execute.

---

# Responsibilities

The Runtime Environment owns:

- Homebrew initialization
- PATH construction
- Environment variables
- Runtime-specific shell initialization

The Runtime Environment does not own:

- aliases
- prompt
- engineering tooling
- user-local customization

Those responsibilities belong to separate Runtime or product modules.

---

# Initialization Order

```text
Shell

↓

Runtime Environment

↓

Runtime Services

↓

Engineering Lab (optional)

↓

User Local (optional)
```

---

# PATH Ownership

Workstation constructs PATH.

PATH is deterministic.

PATH entries are added according to Runtime policy.

Individual capabilities never modify PATH.

---

# Homebrew

Homebrew is the Runtime package provider for macOS.

Runtime Environment initializes Homebrew.

No other module initializes Homebrew.

---

# User Local

User-local initialization executes last.

User-local customization is intentionally excluded from version control.

---

# Version 1

Version 1 initializes:

- Homebrew
- PATH

Additional Runtime initialization may be introduced without changing the initialization contract.