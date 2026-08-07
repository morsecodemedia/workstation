#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/../../lib/runtime.sh"
source "$(dirname "${BASH_SOURCE[0]}")/providers/macos.sh"

parse_args "$@"

json="$(platform_detect_macos)"

if [[ "$PRETTY" == true ]]; then
    printf "%s\n" "$json" | render_pretty
else
    printf "%s\n" "$json"
fi