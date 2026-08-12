# Runtime SDK

**Status**

**Draft**

---

# Purpose

The Runtime SDK provides the foundational building blocks used by Workstation capabilities, Runtime Commands, and Shell Adapters.

The Runtime SDK exists to eliminate duplicated implementation while preserving clear responsibility boundaries.

Runtime is infrastructure.

It does not implement product behavior.

---

# Responsibility

The Runtime SDK provides reusable primitives for common operating system interactions.

Examples include:

- filesystem discovery
- editor integration
- preview rendering
- shell history
- navigation
- platform abstraction

The Runtime SDK never owns business logic.

Business logic belongs to capabilities and products.

---

# Architecture

The Runtime SDK consists of three layers.

```text
Applications
        │
        ▼
Capabilities
        │
        ▼
Runtime Commands
        │
        ▼
Runtime Primitives
        │
        ▼
Shell Adapters
        │
        ▼
Operating System
```

Each layer has a single responsibility.

---

# Runtime Primitives

Runtime Primitives are reusable implementation functions.

They provide the smallest reusable units of Runtime behavior.

Examples:

- `editor_open()`
- `preview_render()`
- `finder_directories()`
- `history_list()`
- `navigation_cd()`

Runtime Primitives:

- are sourced
- have no executable code
- expose reusable functions
- avoid side effects whenever practical

Runtime Primitives never contain product-specific behavior.

---

# Runtime Commands

Runtime Commands expose Runtime Primitives as executable commands.

They exist because subprocesses cannot invoke sourced shell functions.

Examples include:

- `preview-render`

Runtime Commands:

- are executable
- contain a shebang
- establish execution policy
- source Runtime
- delegate immediately to a Runtime Primitive

Runtime Commands contain no implementation logic beyond adapting execution.

---

# Shell Adapters

Shell Adapters extend the current interactive shell.

Examples include:

- `fd`
- `fda`
- `fh`

Shell Adapters:

- are sourced
- may define shell functions
- may define aliases
- may modify shell state
- may change the current working directory

Shell Adapters exist because certain shell behaviors cannot be implemented by child processes.

---

# Dependency Rules

Dependencies flow in one direction.

```text
Applications

↓

Capabilities

↓

Runtime Commands

↓

Runtime Primitives

↓

Shell Adapters

↓

Operating System
```

Higher layers depend upon lower layers.

Lower layers never depend upon higher layers.

Runtime Primitives never invoke Runtime Commands.

Runtime Commands delegate to Runtime Primitives.

Shell Adapters consume Runtime Primitives.

---

# Naming Conventions

## Runtime Primitives

Runtime Primitive functions follow:

```text
module_verb()
```

Examples:

- `editor_open()`
- `preview_render()`
- `finder_files()`
- `finder_directories()`
- `selector_choose()`
- `history_list()`
- `navigation_cd()`

---

## Runtime Commands

Runtime Commands follow:

```text
module-verb
```

Examples:

- `preview-render`

Runtime Commands correspond directly to Runtime Primitive functions whenever practical.

---

## Shell Adapters

Shell Adapter names follow established interactive shell conventions.

Examples:

- `fd`
- `fda`
- `fh`

Shell Adapters prioritize developer ergonomics over strict naming consistency.

---

# Repository Layout

```text
lib/

    runtime.sh

    runtime/

        editor.sh
        finder.sh
        history.sh
        navigation.sh
        preview.sh
        selector.sh

    shell/

        history.sh
        navigation.sh

bin/

    preview-render
```

`runtime.sh` aggregates Runtime Primitives into a single Runtime entry point.

---

# Design Principles

The Runtime SDK follows the following principles.

## One Responsibility

Each Runtime Primitive owns one responsibility.

---

## Composition

Capabilities compose Runtime Primitives.

Runtime Primitives do not compose capabilities.

---

## No Business Logic

Business logic belongs to capabilities.

Runtime provides infrastructure only.

---

## Thin Commands

Runtime Commands exist only to expose Runtime Primitives to external processes.

---

## Shell Awareness

Shell-specific behavior belongs in Shell Adapters.

Shell Adapters isolate interactive shell behavior from Runtime infrastructure.

---

# Examples

Opening a file.

```text
fe

↓

editor_open()
```

Previewing a file.

```text
preview-render

↓

preview_render()
```

Changing directories.

```text
fd

↓

finder_directories()

↓

selector_choose()

↓

navigation_cd()
```

---

# Future

Potential future Runtime modules include:

- clipboard
- archive
- process
- network
- terminal
- json
- yaml
- filesystem
- execution

The Runtime SDK should grow only when multiple consumers justify a new Runtime Primitive.

Runtime follows the same architectural principle as the MCU:

> Responsibilities Outlive Implementations.