#!/usr/bin/env bash

################################################################################
# Package Management
#
# Operation:
#   Apply
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


################################################################################
# Input
################################################################################

package_plan="$(cat)"

################################################################################
# Validation
################################################################################


operations="$(
    printf "%s\n" "${package_plan}" \
        | jq '
            .operations
            | map({
                action: .action,
                package: .package,
                status: "planned"
            })
        '
)"


################################################################################
# Version 1
################################################################################

jq -n \
  --argjson operations "${operations}" '

{
    schema: "package-result/v1",
    success: true,
    operations: $operations,
    warnings: []
}
'