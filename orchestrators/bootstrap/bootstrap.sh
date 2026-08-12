#!/usr/bin/env bash

set -euo pipefail

################################################################################
# Bootstrap Orchestrator
################################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

# shellcheck source=../../lib/runtime.sh
source "${ROOT}/lib/runtime.sh"

parse_args "$@"

echo "Bootstrap"

################################################################################
# Execution State
################################################################################

execution_state='{}'

################################################################################
# Stage 1
#
# Platform Detection
################################################################################

echo
echo "Stage 1: Platform Detection"

platform_description="$(
    "${ROOT}/bin/workstation" platform detect
)"

execution_state="$(
    execution_state_compose \
        "${execution_state}" \
        platform \
        "${platform_description}"
)"

printf "%s\n" "${execution_state}" | jq .

################################################################################
# Stage 2
#
# Prerequisite Validation
################################################################################

echo
echo "Stage 2: Prerequisite Validation"

validation_report="$(
    printf "%s\n" "${execution_state}" \
        | "${ROOT}/bin/workstation" prerequisites validate
)"

execution_state="$(
    execution_state_compose \
        "${execution_state}" \
        validation \
        "${validation_report}"
)"

printf "%s\n" "${execution_state}" | jq .

################################################################################
# Stage 3
#
# Package Planning
################################################################################

echo
echo "Stage 3: Package Planning"

package_plan="$(
    printf "%s\n" "${execution_state}" \
        | "${ROOT}/bin/workstation" packages plan
)"

execution_state="$(
    execution_state_compose \
        "${execution_state}" \
        packages \
        "${package_plan}"
)"

printf "%s\n" "${execution_state}" | jq .

################################################################################
# Remaining Stages
################################################################################

echo
echo "Stage 4: Package Application"

echo
echo "Stage 5: Configuration Deployment"

echo
echo "Stage 6: Verification"

echo
echo "Bootstrap complete."