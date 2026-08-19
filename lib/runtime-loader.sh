#!/usr/bin/env bash

################################################################################
# Repository
################################################################################

LIB_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

RUNTIME_DIR="${LIB_DIR}/runtime"

################################################################################
# Runtime Modules
#
## Runtime Environment
################################################################################

# shellcheck source=runtime/logging.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/logging.sh"

# shellcheck source=runtime/environment.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/environment.sh"

# shellcheck source=runtime/xdg.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/xdg.sh"

# shellcheck source=runtime/path.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/path.sh"

# shellcheck source=runtime/node.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/node.sh"

# shellcheck source=runtime/history.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/history.sh"

# shellcheck source=runtime/shell.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/shell.sh"

# shellcheck source=runtime/aliases.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/aliases.sh"

# shellcheck source=runtime/terminal.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/terminal.sh"

# shellcheck source=runtime/prompt.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/prompt.sh"

################################################################################
## Runtime Services
################################################################################

# shellcheck source=runtime/configuration.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/configuration.sh"

# shellcheck source=runtime/catalog.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/catalog.sh"

################################################################################
## Developer Services
################################################################################

# shellcheck source=runtime/editor.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/editor.sh"

# shellcheck source=runtime/preview.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/preview.sh"

# shellcheck source=runtime/finder.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/finder.sh"

# shellcheck source=runtime/selector.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/selector.sh"

# shellcheck source=runtime/navigation.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/navigation.sh"

################################################################################
# Runtime Services
################################################################################

# shellcheck source=runtime/products.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/products.sh"

################################################################################
# Orchestration
################################################################################

# shellcheck source=orchestration.sh
# shellcheck disable=SC1091
source "${LIB_DIR}/orchestration.sh"