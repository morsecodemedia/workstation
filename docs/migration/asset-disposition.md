# Asset Disposition

## Purpose

The Asset Disposition defines the long-term ownership of every responsibility contained within the legacy dotfiles repository.

It answers one question:

> **What should become of this asset?**

Asset Disposition is architectural.

It does not track implementation progress.

Implementation progress is tracked by the Migration Plan.

---

# `.config/`

| Asset | Disposition | Owner | Notes |
|-------|-------------|-------|-------|
| aerc | 🗑️ Sunset | — | Email client is outside the scope of Workstation. |
| ag | 🔄 Replace | Runtime | Replace with ripgrep. |
| aider | ➡️ Move | Engineering Lab | AI engineering belongs in Engineering Lab. |
| asciinema | 🗑️ Sunset | — | Outside Version 1 scope. |
| curl | ✅ Keep | Runtime | Foundational runtime dependency. |
| git | ✅ Keep | Runtime | Foundational runtime dependency. |
| i3 | 🗑️ Sunset | — | Linux window manager outside Version 1 scope. |
| kitty | 📦 Keep | Configuration | Configuration-driven dependency. |
| lynx | 🗑️ Sunset | — | Legacy workflow. |
| mpv | ➡️ Move | Engineering Lab | Engineering media tooling. |
| newsboat | 🗑️ Sunset | — | Personal workflow. |
| npm | 🔄 Normalize | Runtime | Node.js owns npm. |
| pulse | 🗑️ Sunset (V1) | — | Revisit if Linux support expands. |
| slrn | 🗑️ Sunset | — | Legacy workflow. |
| tmux | 📦 Keep | Configuration | Configuration-driven dependency. |
| vim | 📦 Keep | Configuration | Preserve configuration independently of editor implementation. |

---

# `bin/`

| Command | Disposition | Owner | Notes |
|---------|-------------|-------|-------|
| ai | ➡️ Move | Engineering Lab | Engineering workflow. |
| audiobook | 🗑️ Sunset | — | Personal workflow. |
| bootstrap | ✅ Keep | Workstation | Bootstrap orchestrator. |
| colors | ✅ Keep | Runtime | Shared CLI utility. |
| ctx | ➡️ Move | Engineering Lab | Context management. |
| doctor | ✅ Keep | Workstation | Diagnostic capability. |
| engineer | ➡️ Move | Engineering Lab | Engineering capability. |
| extract | 🤔 Hold | TBD | Re-evaluate responsibility. |
| fkill | 🤔 Hold | TBD | Review before migration. |
| flog | 🤔 Hold | TBD | Review before migration. |
| lab | ✅ Keep | MCU | Candidate MCU-level command. |
| maildirect.sh | 🗑️ Sunset | — | Personal workflow. |
| mpv-cmd | ➡️ Move | Engineering Lab | Media workflow. |
| mpv-pause | ➡️ Move | Engineering Lab | Media workflow. |
| music | 🗑️ Sunset | — | Personal workflow. |
| n | 🤔 Hold | TBD | Needs review. |
| news | 🗑️ Sunset | — | Personal workflow. |
| overdrive | 🗑️ Sunset | — | Legacy workflow. |
| plan | ✅ Keep | Engineering Lab | Core engineering workflow. |
| pulsefix | 🗑️ Sunset | — | Linux-specific. |
| recentbooks | 🗑️ Sunset | — | Personal workflow. |
| review | ✅ Keep | Engineering Lab | Core engineering workflow. |
| shorten | 🤔 Hold | TBD | Utility review required. |
| swap | ✅ Keep | Runtime | Small focused runtime utility. |
| task | ✅ Keep | Engineering Lab | Engineering workflow. |
| tre | 🔄 Rewrite | Runtime | Evolve into richer inspection tooling. |
| yl | 🔄 Rewrite | TBD | Preserve responsibility. |
| yw | 🔄 Rewrite | TBD | Preserve responsibility. |

---

# `lib/`

| Asset            | Disposition | Notes                                                                                                                       |
| ---------------- | ----------- | --------------------------------------------------------------------------------------------------------------------------- |
| `knowledge.sh`   | 🔄 Modify   | Evolve into shared runtime knowledge services or move portions to Engineering Lab if they become engineering-specific.      |
| `matcher.sh`     | 🔄 Modify   | Keep the responsibility, redesign the implementation around the new capability architecture.                                |
| `workstation.sh` | 🔄 Modify   | This is likely to become the primary shared Workstation runtime library. Preserve responsibility, modernize implementation. |

---

# `knowledge/`

| Asset                    | Disposition  | Owner       | Notes                                                                                                   |
| ------------------------ | ------------ | ----------- | ------------------------------------------------------------------------------------------------------- |
| `shell-configuration.sh` | ⬆️ Modernize | Workstation | Already aligned with the new architecture. Evolve as Runtime and shell support mature.                  |
| `workstation.sh`         | ⬆️ Modernize | Workstation | Shared Workstation knowledge. Preserve responsibility, modernize implementation as capabilities evolve. |

---

# `.functions/`

| Function         | Responsibility                                                  | Disposition   | Owner               | Notes                                                                                                                            |
| ---------------- | --------------------------------------------------------------- | ------------- | ------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `cd.sh`          | Directory navigation / Node runtime activation                  | 🔄 Split      | Runtime             | Split into two responsibilities. Replace directory tracking with `zoxide`; preserve Node runtime activation as a Runtime module. |
| `z.sh`           | Intelligent directory navigation                                | 🔄 Rewrite    | Runtime             | Preserve the responsibility. Replace implementation with `zoxide`.                                                               |
| `cdroot.sh`      | Navigate to repository root                                     | 🔄 Rewrite    | Engineering Lab     | Promote into an Engineering Lab project capability (e.g. `engineer project root`).                                               |
| `fd.sh`          | Interactive directory navigation                                | 🔄 Rewrite    | Runtime             | Preserve responsibility. Rename to avoid collision with the `fd` executable and modernize implementation.                        |
| `fda.sh`         | Interactive directory navigation (including hidden directories) | 🔄 Rewrite    | Runtime             | Merge with `fd.sh` as an option (`--all`) rather than maintaining a separate command.                                            |
| `fe.sh`          | Interactive file selection and editing                          | ⬆️ Modernize  | Runtime             | Excellent responsibility. Keep the workflow. Extract preview/editor behavior into Runtime services.                              |
| `fh.sh`          | Interactive command history recall                              | 🔄 Rewrite    | Runtime             | Preserve responsibility. Replace shell injection implementation with shell-native adapters.                                      |
| `gitfetchall.sh` | Synchronize local tracking branches with remote branches        | 🔄 Rewrite    | Engineering Lab     | Preserve responsibility. Promote into an Engineering Lab Git capability and make execution idempotent.                           |
| `gsum.sh`        | AI-assisted engineering review for Git commits                  | 🔄 Rewrite    | Engineering Lab     | Expand into an Engineering Review capability. Separate suggestion and execution.                                                 |
| `imgsz.sh`       | Image metadata inspection                                       | 🔄 Rewrite    | Image Lab           | Expand into an Image Inspection discovery capability. Dimensions become the first operation.                                     |
| `rr.sh`          | Shell entertainment                                             | 🧸 Misfit Toy | Isle of Misfit Toys | Preserve for posterity rather than migrating into a product repository.                                                          |
| `td.sh`          | Workspace activation / resume work                              | ⏸️ Hold       | TBD                 | Responsibility transcends Engineering Lab. Revisit once the Productivity domain is defined.                                      |

## Migration Observations

The review of legacy shell functions identified a potential MCU product that has not yet been formally defined.

Responsibilities related to task management, workspace activation, and cross-domain productivity do not fit cleanly within Workstation or Engineering Lab.

These responsibilities remain on hold pending definition of a future Productivity-oriented repository.

# Migration Principles

- Responsibilities outlive implementations.
- Every retained responsibility receives an MCU owner.
- Every migrated responsibility becomes declarative where practical.
- Legacy implementations are archived only after Workstation becomes the authoritative implementation.