#!/usr/bin/env bash

################################################################################
# Package Management
#
# Operation:
#   Plan
#
# Purpose:
#   Produce a deterministic Package Plan from the current Execution State.
################################################################################

source "$(dirname "${BASH_SOURCE[0]}")/../../lib/runtime.sh"

parse_args "$@"

################################################################################
# Input
################################################################################

execution_state="$(cat)"

################################################################################
# Validation
################################################################################

supported="$(
    printf "%s\n" "${execution_state}" \
        | jq -r '.validation.supported'
)"

################################################################################
# Unsupported Platform
################################################################################

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

################################################################################
# Version 1
################################################################################

jq -n '
{
    schema: "package-plan/v1",
    manager: "brew",
    operations: [],
    warnings: []
}
'