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
- [x] Runtime Loader
- [x] Interactive Runtime Bootstrap
- [x] Shell Adapter Layer
- [x] Shell initialization modernization
- [x] CLI modernization
- [ ] Renderers
- [x] Verification Framework

---

## Runtime Dependencies

- [x] Runtime Package Catalog
- [x] Git
- [x] curl
- [x] Node.js
- [ ] Runtime package verification

---

## Runtime Search

- [ ] Implement Runtime FZF module
- [ ] Integrate ripgrep backend
- [ ] Integrate fd backend
- [ ] Build Runtime Search service

---

# Configuration

## Git

- [x] config
- [x] ignore

## Kitty

- [x] kitty.conf
- [x] themes

## tmux

- [x] tmux.conf

## Vim

- [x] vimrc
- [ ] plugins
- [ ] Migrate Vim plugin manager installation / Implement Vim package provider

## Applications

- [x] curl
- [x] asciinema
- [x] mpv

## Shell

- [x] Runtime Environment
- [x] PATH
- [x] XDG
- [x] History
- [x] Prompt
- [x] Terminal
- [x] Runtime aliases
- [x] Shell adapter layer
- [x] Navigation adapters
- [x] Editor adapters
- [x] History adapters

- [ ] Engineering Lab aliases
- [ ] Productivity aliases
- [ ] Personal aliases

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

# Release Readiness

## Runtime

- [x] Runtime SDK
- [x] Runtime Loader
- [x] Interactive Runtime Bootstrap
- [x] Shell Adapter Layer

## Verification

- [x] Runtime Verification
- [x] Interactive Verification
- [ ] Bootstrap Verification
- [ ] Configuration Verification

## Configuration Contract

- [x] Git
- [x] Kitty
- [x] tmux
- [x] Vim
- [x] curl
- [x] asciinema
- [x] mpv

# Workstation Version 1 Exit Criteria

A Version 1 release is complete when:

- [x] Runtime SDK exists.
- [x] Bootstrap orchestrates the workstation.
- [x] Package Management performs real execution.
- [x] Configuration Management performs real deployment.
- [x] Verification framework is implemented.
- [ ] Interactive shell bootstraps exclusively through Workstation.
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