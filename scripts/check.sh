#!/usr/bin/env bash

set -euo pipefail

ROOT="$(
    cd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null 2>&1
    pwd
)"

"${ROOT}/scripts/chmod.sh"

# "${ROOT}/scripts/lint.sh"