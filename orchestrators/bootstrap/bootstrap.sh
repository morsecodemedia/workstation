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

if is_pretty; then
    info "PRETTY MODE ENABLED"
fi

if is_pretty; then
  info "Bootstrap"
fi

################################################################################
# Execution State
################################################################################

execution_state="$(
    execution_state_initialize
)"

################################################################################
# Stage 1
#
# Platform Detection
################################################################################

if is_pretty; then
  info "Stage 1: Platform Detection"
fi

platform_description="$(
    "${ROOT}/bin/workstation" platform detect
)"

execution_state="$(
    execution_state_compose \
        "${execution_state}" \
        platform \
        "${platform_description}"
)"


################################################################################
# Stage 2
#
# Prerequisite Validation
################################################################################

if is_pretty; then
  info "Stage 2: Prerequisite Validation"
fi

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

################################################################################
# Stage 3
#
# Package Planning
################################################################################

if is_pretty; then
  info "Stage 3: Package Planning"
fi

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

################################################################################
# Stage 4
#
# Package Application
################################################################################

if is_pretty; then
  info "Stage 4: Package Application"
fi

package_result="$(
    printf "%s\n" "${package_plan}" \
        | "${ROOT}/bin/workstation" packages apply
)"

execution_state="$(
    execution_state_compose \
        "${execution_state}" \
        package_result \
        "${package_result}"
)"

################################################################################
# Stage 5
#
# Configuration Deployment
################################################################################

if is_pretty; then
  info "Stage 5: Configuration Deployment"
fi

configuration_state="$(
    printf "%s\n" "${execution_state}" \
        | "${ROOT}/bin/workstation" config deploy
)"

execution_state="$(
    execution_state_compose \
        "${execution_state}" \
        configuration \
        "${configuration_state}"
)"

################################################################################
# Remaining Stages
################################################################################

if is_pretty; then
  info "Stage 6: Verification"
fi

printf "%s\n" "${execution_state}"