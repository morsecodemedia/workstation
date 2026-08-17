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

parse_args "$@"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

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

catalog="${ROOT}/packages/runtime.json"

packages="$(
    catalog_packages "${catalog}"
)"

operations="$(
    printf "%s\n" "${packages}" \
    | jq '
        map({
            action: .action,
            package: .id,
            reason: .reason
        })
    '
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

jq -n \
    --argjson operations "${operations}" '
{
    schema: "package-plan/v1",
    manager: "brew",
    operations: $operations,
    warnings: []
}
'