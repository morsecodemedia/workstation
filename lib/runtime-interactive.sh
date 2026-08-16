#!/usr/bin/env bash

################################################################################
# Interactive Runtime Bootstrap
################################################################################

SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1
    pwd
)"

################################################################################
# Runtime SDK
################################################################################

# shellcheck source=runtime-loader.sh
source "${SCRIPT_DIR}/runtime-loader.sh"

################################################################################
# Interactive Runtime
################################################################################

if ! runtime_environment_initialize; then

    runtime_warn \
        "Interactive Runtime initialization failed. Continuing with shell."

fi