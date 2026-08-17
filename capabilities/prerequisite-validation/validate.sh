#!/usr/bin/env bash

#
# Prerequisite Validation
#
# Operation:
#   Validate
#
# Purpose:
#   Evaluate a Platform Description against the Workstation
#   Version 1 support policy.
#

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

################################################################################
# Input
################################################################################

platform_description="$(cat)"

################################################################################
# Extract Platform Facts
################################################################################

os="$(printf '%s\n' "${platform_description}" | jq -r '.platform.platform.os')"

architecture="$(printf '%s\n' "${platform_description}" | jq -r '.platform.platform.architecture')"

################################################################################
# Validation
################################################################################

supported=true

errors=()

warnings=()

################################################################################
# Operating System
################################################################################

if [[ "${os}" != "macos" ]]; then
    supported=false
    errors+=("Unsupported operating system: ${os}")
fi

################################################################################
# Architecture
################################################################################

if [[ "${architecture}" != "arm64" ]]; then
    supported=false
    errors+=("Unsupported CPU architecture: ${architecture}")
fi

################################################################################
# Output
################################################################################

errors_json='[]'

if ((${#errors[@]})); then
    errors_json="$(printf '%s\n' "${errors[@]}" | jq -R . | jq -s .)"
fi

warnings_json='[]'

if ((${#warnings[@]})); then
    warnings_json="$(printf '%s\n' "${warnings[@]}" | jq -R . | jq -s .)"
fi

jq -n \
    --argjson supported "${supported}" \
    --argjson errors "${errors_json}" \
    --argjson warnings "${warnings_json}" \
'
{
    schema: "validation-report/v1",
    supported: $supported,
    errors: $errors,
    warnings: $warnings
}
'