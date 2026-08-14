# Migration Plan

## Purpose

The Migration Plan translates the Asset Disposition into executable implementation work.

Asset Disposition defines ownership.

Migration Plan defines execution.

---

# Current Status

## Platform

- [x] Runtime SDK
- [x] Capability Framework
- [x] Execution State
- [x] Bootstrap Orchestrator
- [x] Machine-first CLI

---

# Runtime

## Runtime Foundation

- [x] Runtime SDK
- [x] Shell initialization modernization
- [x] CLI modernization
- [ ] Renderers
- [ ] Verification

---

## Runtime Dependencies

- [x] Git
- [x] curl
- [x] Node.js
- [x] ripgrep

---

# Configuration

## Git

- [x] .gitconfig
- [x] .gitignore_global

## Kitty

- [x] kitty.conf
- [x] themes

## tmux

- [x] tmux.conf

## Vim

- [ ] vimrc
- [ ] plugins

## Shell

- [ ] aliases
- [ ] prompt
- [ ] environment
- [ ] PATH
- [ ] XDG

---

# Engineering Lab

## Engineering Commands

- [ ] ai
- [ ] engineer
- [ ] ctx
- [ ] plan
- [ ] review
- [ ] task
- [ ] git synchronization

---

# Image Lab

- [ ] Image inspection
- [ ] Image metadata
- [ ] Image dimensions

---

# Productivity (Pending)

- [ ] Workspace activation
- [ ] Cross-project task management
- [ ] Personal work management

---

# Isle of Misfit Toys

- [ ] rr

---

# Workstation Version 1 Exit Criteria

A Version 1 release is complete when:

- [x] Runtime SDK exists.
- [x] Bootstrap orchestrates the workstation.
- [x] Package Management performs real execution.
- [x] Configuration Management performs real deployment.
- [ ] Verification capability is implemented.
- [ ] Every retained configuration has been migrated from the legacy repository.
- [ ] Daily development is performed exclusively using Workstation.
- [ ] The legacy dotfiles repository can be archived.

---

# Migration Workflow

Every migration follows the same workflow.

```text
Legacy Configuration

↓

Move to Workstation

↓

Bootstrap

↓

Daily Use

↓

Delete from Legacy Repository

↓

Commit
```

Migration is complete when the legacy repository is no longer required for day-to-day development.