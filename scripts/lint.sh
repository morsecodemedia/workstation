#!/usr/bin/env bash

set -euo pipefail

ROOT="$(
    cd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null 2>&1
    pwd
)"

cd "${ROOT}"

find \
    bin \
    capabilities \
    lib \
    orchestrators \
    shell \
    scripts \
    -type f \
    -name "*.sh" \
    -print0 \
| xargs -0 shellcheck -x