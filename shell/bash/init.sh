#!/usr/bin/env bash

################################################################################
# Repository
################################################################################

SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

ROOT="$(
    cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Runtime
################################################################################

# shellcheck source=../../lib/runtime-interactive.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/runtime-interactive.sh"

################################################################################
# Shell
################################################################################

# shellcheck source=../../lib/shell-loader.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/shell-loader.sh"

################################################################################
# Local Extensions
################################################################################

if [[ -r "${HOME}/.profile_local" ]]; then

    # shellcheck disable=SC1090
    source "${HOME}/.profile_local"

fi