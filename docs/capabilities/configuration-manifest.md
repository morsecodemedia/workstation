# Configuration Manifest

## Purpose

The Configuration Manifest is the authoritative definition of the configuration that should exist on a managed workstation.

It defines the **Desired State** for Configuration Management.

Configuration Management never discovers what should be deployed.

It consumes the Configuration Manifest.

---

# Ownership

## Owner

Bootstrap

Bootstrap determines the desired workstation configuration and produces the Configuration Manifest.

## Consumers

Configuration Management

- Deploy
- Remove
- Status
- Verify

Future capabilities may also consume the manifest.

---

# Configuration Object

The Configuration Manifest is composed of Configuration Objects.

Each Configuration Object represents one managed configuration artifact.

---

## Configuration Object

Every Configuration Object contains:

### Identifier

A unique name.

Example:

```text
git
```

---

### Source

Repository-relative location.

Example:

```text
config/git/.gitconfig
```

---

### Destination

Target location on the workstation.

Example:

```text
~/.gitconfig
```

---

### Deployment Method

How the object should be deployed.

Examples:

- symlink
- copy
- generate

Version 1 supports:

```text
symlink
```

only.

---

### Enabled

Whether this object should be deployed.

Example:

```text
true
```

---

## Example

```yaml
configuration:

  - id: git

    source: config/git/.gitconfig

    destination: ~/.gitconfig

    method: symlink

    enabled: true

  - id: bash

    source: config/bash/.bashrc

    destination: ~/.bashrc

    method: symlink

    enabled: true
```

---

# Desired State

Desired State is defined entirely by the Configuration Manifest.

Configuration Management never determines Desired State.

---

# Current State

Current State is produced by evaluating every Configuration Object.

Each object exists in exactly one state.

- Deployed
- Missing
- Modified
- Unknown

---

# Operations

Deploy

Creates every enabled Configuration Object.

---

Remove

Removes every deployed Configuration Object.

---

Status

Reports the Current State of every Configuration Object.

---

Verify

Compares Desired State with Current State.

---

# Version 1

Version 1 supports:

- filesystem configuration
- symbolic links
- enabled / disabled configuration

Version 1 intentionally excludes:

- templates
- generated configuration
- variables
- conditional deployment
- package dependencies
- remote assets

These features belong to future versions.

---

# Architectural Principles

The Configuration Manifest is the single source of truth for workstation configuration.

Configuration Management consumes the manifest.

Bootstrap produces the manifest.

Neither capability assumes the responsibilities of the other.