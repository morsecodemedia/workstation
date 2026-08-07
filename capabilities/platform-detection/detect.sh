#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/../../lib/runtime.sh"
source "$(dirname "${BASH_SOURCE[0]}")/providers/macos.sh"

parse_args "$@"

json="$(platform_detect_macos)"

if is_pretty; then
    printf "%s\n" "${json}" \
        | "$(dirname "${BASH_SOURCE[0]}")/renderers/pretty.sh"
else
    printf "%s\n" "${json}"
fi