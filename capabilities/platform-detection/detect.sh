#!/usr/bin/env bash

SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

ROOT="$(
    cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 || exit
    pwd
)"

# shellcheck source=../../lib/runtime.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/runtime.sh"

# shellcheck source=providers/macos.sh
# shellcheck disable=SC1091
source "${SCRIPT_DIR}/providers/macos.sh"

parse_args "$@"

json="$(platform_detect_macos)"

if is_pretty; then
    printf "%s\n" "${json}" \
        | "$(dirname "${BASH_SOURCE[0]}")/renderers/pretty.sh"
else
    printf "%s\n" "${json}"
fi