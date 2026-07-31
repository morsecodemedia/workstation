# Configuration State

## Purpose

Configuration State defines the objects managed by the Configuration Management capability.

Configuration State is the shared language used by every Configuration Management operation.

---

## Configuration Object

A Configuration Object represents one managed configuration artifact.

Every Configuration Object has:

- Identifier
- Source
- Destination
- Deployment Method
- Current State

---

## Desired State

Desired State is the authoritative list of Configuration Objects that should exist on the workstation.

Desired State is produced by Bootstrap.

Configuration Management consumes Desired State.

---

## Current State

Current State represents the observed state of every Configuration Object.

Current State is produced by the Status operation.

---

## State Values

Each Configuration Object exists in exactly one state.

- Not Deployed
- Deployed
- Modified
- Missing
- Unknown

---

## State Transitions

Deploy

Not Deployed → Deployed

Remove

Deployed → Not Deployed

Status

Observe Current State

Verify

Compare Desired State with Current State