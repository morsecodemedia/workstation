#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

# shellcheck source=../../lib/runtime-interactive.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/runtime-interactive.sh"