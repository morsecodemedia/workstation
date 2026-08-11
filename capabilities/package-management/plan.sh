#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/../../lib/runtime.sh"

parse_args "$@"

validation_report="$(cat)"

supported="$(
    printf "%s\n" "${validation_report}" \
        | jq -r '.supported'
)"

printf "%s\n" "${supported}"