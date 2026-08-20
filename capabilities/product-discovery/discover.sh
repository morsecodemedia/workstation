#!/usr/bin/env bash

set -euo pipefail

################################################################################
# Repository
################################################################################

SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

ROOT="$(
    cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Runtime
################################################################################

# shellcheck source=../../lib/runtime.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/runtime.sh"

parse_args "$@"


################################################################################
# Installation
################################################################################

INSTALLATION_ENV="${HOME}/.config/workstation/installation.env"

if [[ ! -r "${INSTALLATION_ENV}" ]]; then
    printf "Product Discovery: Workstation is not registered.\n" >&2
    exit 1
fi

# shellcheck disable=SC1090
source "${INSTALLATION_ENV}"

################################################################################
# Discovery
################################################################################

products="$(
    runtime_products_discover "${PRODUCT_ROOT}"
)"

################################################################################
# Output
################################################################################

result="$(
    jq -n \
        --argjson products "${products}" '
{
    schema: "product-discovery/v1",
    products: $products,
    warnings: []
}
'
)"

if is_pretty; then

    printf "%s\n" "${result}" \
        | "${SCRIPT_DIR}/renderers/pretty.sh"

else

    printf "%s\n" "${result}"

fi