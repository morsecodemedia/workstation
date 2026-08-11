# dotfiles-minimal/.config/

| Asset     | Disposition            | Owner           | Notes                                                                                      |
| --------- | ---------------------- | --------------- | ------------------------------------------------------------------------------------------ |
| aerc      | 🗑️ Sunset             | —               | Email client is outside the scope of the Workstation product.                              |
| ag        | 🔄 Replace             | Runtime         | Replace with **ripgrep** as the supported search utility.                                  |
| aider     | ➡️ Move                | Engineering Lab | AI-assisted engineering belongs to Engineering Lab rather than Workstation.                |
| asciinema | 🗑️ Sunset             | —               | Nice utility, but not part of the foundational workstation experience.                     |
| curl      | ✅ Keep                 | Runtime         | Foundational runtime dependency.                                                           |
| git       | ✅ Keep                 | Runtime         | Foundational runtime dependency.                                                           |
| i3        | 🗑️ Sunset             | —               | Linux window manager; outside Version 1 scope.                                             |
| kitty     | 📦 Keep                | Configuration   | Configuration-driven dependency. The package exists because the configuration exists.      |
| lynx      | 🗑️ Sunset             | —               | Legacy browser; no longer part of the desired workstation experience.                      |
| mpv       | ➡️ Move                | Engineering Lab | Media tooling supports Engineering workflows rather than the Workstation itself.           |
| newsboat  | 🗑️ Sunset             | —               | Personal workflow tool rather than a workstation foundation.                               |
| npm       | 🔄 Normalize           | Runtime         | Treat the dependency as **Node.js**, not npm. npm is provided by the Node.js installation. |
| pulse     | 🗑️ Sunset (Version 1) | —               | Revisit only if Linux support later requires PulseAudio integration.                       |
| slrn      | 🗑️ Sunset             | —               | Legacy workflow; outside Version 1 scope.                                                  |
| tmux      | 📦 Keep                | Configuration   | Configuration-driven dependency.                                                           |
| vim       | 📦 Keep                | Configuration   | Preserve configuration. Editor implementation may evolve (e.g. Neovim) independently.      |

---

# dotfiles-minimal/bin/

| Command         | Recommendation            | Reason                                                                                 |
| --------------- | ------------------------- | -------------------------------------------------------------------------------------- |
| `ai`            | ➡️ Engineering Lab        | AI engineering workflow, not Workstation.                                              |
| `audiobook`     | 🗑️ Sunset                | Personal workflow.                                                                     |
| `bootstrap`     | ✅ Keep                    | Core Workstation capability.                                                           |
| `colors`        | ✅ Keep                    | Shared CLI utility; likely Runtime.                                                    |
| `ctx`           | 🤔 Keep (Engineering Lab) | Context management feels like Engineering Lab infrastructure.                          |
| `doctor`        | ✅ Keep                    | Core Workstation capability.                                                           |
| `engineer`      | ➡️ Engineering Lab        | Engineering capability.                                                                |
| `extract`       | 🤔 Hold                   | I'd mark **Hold**, not Keep. We need to rediscover its responsibility before deciding. |
| `fkill`         | 🤔 Hold                   | Same. Is it generic enough for Runtime or just a convenience alias?                    |
| `flog`          | 🤔 Hold                   | Same. We should review implementation before deciding.                                 |
| `lab`           | ✅ Keep                    | I actually think this becomes an MCU-level command eventually.                         |
| `maildirect.sh` | 🗑️ Sunset                | Personal workflow.                                                                     |
| `mpv-cmd`       | ➡️ Engineering Lab        | Supports Engineering media workflows.                                                  |
| `mpv-pause`     | ➡️ Engineering Lab        | Same.                                                                                  |
| `music`         | 🗑️ Sunset                | Personal workflow.                                                                     |
| `n`             | 🤔 Hold                   | Need to inspect. The name alone isn't enough to decide.                                |
| `news`          | 🗑️ Sunset                | Personal workflow.                                                                     |
| `overdrive`     | 🗑️ Sunset                | Legacy/personal workflow.                                                              |
| `plan`          | ✅ Keep                    | This has become a core engineering workflow.                                           |
| `pulsefix`      | 🗑️ Sunset                | Version 1. Can be reintroduced if Linux audio becomes a supported concern.             |
| `recentbooks`   | 🗑️ Sunset                | Personal workflow.                                                                     |
| `review`        | ✅ Keep                    | Core engineering methodology.                                                          |
| `shorten`       | 🤔 Keep                   | Utility. We need to rediscover its responsibility.                                     |
| `swap`          | ✅ Keep                    | Small, focused utility. Good Runtime candidate.                                        |
| `task`          | ✅ Keep                    | Fits the engineering workflow we've been building.                                     |
| `tre`           | 🔄 Rewrite                | I think this becomes `workstation tree` or evolves into a richer inspection tool.      |
| `yl`            | 🔄 Rewrite                | Preserve responsibility, redesign implementation once we understand it.                |
| `yw`            | 🔄 Rewrite                | Same as `yl`.                                                                          |

---

# dotfiles-minimal/lib/

| Asset            | Disposition | Notes                                                                                                                       |
| ---------------- | ----------- | --------------------------------------------------------------------------------------------------------------------------- |
| `knowledge.sh`   | 🔄 Modify   | Evolve into shared runtime knowledge services or move portions to Engineering Lab if they become engineering-specific.      |
| `matcher.sh`     | 🔄 Modify   | Keep the responsibility, redesign the implementation around the new capability architecture.                                |
| `workstation.sh` | 🔄 Modify   | This is likely to become the primary shared Workstation runtime library. Preserve responsibility, modernize implementation. |

---

# dotfiles-minimal/knowledge/

| Asset                    | Disposition  | Owner       | Notes                                                                                                   |
| ------------------------ | ------------ | ----------- | ------------------------------------------------------------------------------------------------------- |
| `shell-configuration.sh` | ⬆️ Modernize | Workstation | Already aligned with the new architecture. Evolve as Runtime and shell support mature.                  |
| `workstation.sh`         | ⬆️ Modernize | Workstation | Shared Workstation knowledge. Preserve responsibility, modernize implementation as capabilities evolve. |

---

# dotfiles-minimal/.functions/

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