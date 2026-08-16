#!/usr/bin/env bash

################################################################################
# Runtime Loader
################################################################################

RUNTIME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/runtime" && pwd)"

################################################################################
# Runtime Primitives
################################################################################

# shellcheck source=runtime/editor.sh
source "${RUNTIME_DIR}/editor.sh"

# shellcheck source=runtime/preview.sh
source "${RUNTIME_DIR}/preview.sh"

# shellcheck source=runtime/finder.sh
source "${RUNTIME_DIR}/finder.sh"

# shellcheck source=runtime/selector.sh
source "${RUNTIME_DIR}/selector.sh"

# shellcheck source=runtime/navigation.sh
source "${RUNTIME_DIR}/navigation.sh"

# shellcheck source=runtime/catalog.sh
source "${RUNTIME_DIR}/catalog.sh"

# shellcheck source=runtime/path.sh
source "${RUNTIME_DIR}/path.sh"

# shellcheck source=runtime/terminal.sh
source "${RUNTIME_DIR}/terminal.sh"

# shellcheck source=runtime/prompt.sh
source "${RUNTIME_DIR}/prompt.sh"

# shellcheck source=runtime/configuration.sh
source "${RUNTIME_DIR}/configuration.sh"

# shellcheck source=runtime/environment.sh
source "${RUNTIME_DIR}/environment.sh"

# shellcheck source=runtime/history.sh
source "${RUNTIME_DIR}/history.sh"

# shellcheck source=runtime/node.sh
source "${RUNTIME_DIR}/node.sh"

# shellcheck source=runtime/shell.sh
source "${RUNTIME_DIR}/shell.sh"

# shellcheck source=runtime/aliases.sh
source "${RUNTIME_DIR}/aliases.sh"

# shellcheck source=runtime/xdg.sh
source "${RUNTIME_DIR}/xdg.sh"

################################################################################
# Orchestration
################################################################################

# shellcheck source=orchestration.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/orchestration.sh"