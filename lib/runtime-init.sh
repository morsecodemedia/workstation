#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=runtime.sh
# shellcheck disable=SC1091
source "${SCRIPT_DIR}/runtime.sh"

runtime_environment_initialize