#!/usr/bin/env bash

################################################################################
# Interactive Runtime Bootstrap
################################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=runtime-loader.sh
source "${SCRIPT_DIR}/runtime-loader.sh"

runtime_environment_initialize