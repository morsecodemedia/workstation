#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/../../lib/runtime.sh"

parse_args "$@"

validation_report="$(cat)"

supported="$(
    printf "%s\n" "${validation_report}" \
        | jq -r '.supported'
)"

if [[ "${supported}" != "true" ]]; then

    jq -n '
    {
        schema: "package-plan/v1",
        manager: null,
        operations: [],
        warnings: [
            "Platform is not supported."
        ]
    }'

    exit 0

fi