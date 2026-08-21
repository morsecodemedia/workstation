#!/usr/bin/env bash

set -euo pipefail

################################################################################
# Repository
################################################################################

ROOT="$(
    cd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null 2>&1
    pwd
)"

################################################################################
# Installation
################################################################################

INSTALLATION_ENV="${HOME}/.config/workstation/installation.env"

if [[ -r "${INSTALLATION_ENV}" ]]; then

    # shellcheck disable=SC1090
    source "${INSTALLATION_ENV}"

fi

################################################################################
# Verification
################################################################################

# shellcheck source=verify-common.sh
# shellcheck disable=SC1091
source "${ROOT}/scripts/verify-common.sh"

################################################################################
# Installation Path
################################################################################

verify_installation() {

    section "Installation"

    check_variable INSTALLATION_SCHEMA
    check_variable PRODUCT_ID
    check_variable PRODUCT_NAME
    check_variable PRODUCT_ROOT
    check_variable PRODUCT_REPOSITORY
    check_variable PRODUCT_CHANNEL
    check_variable PRODUCT_VERSION

}

################################################################################
# Main
################################################################################

printf "\n"
printf "Installation Verification\n"
printf "=========================\n"

verify_installation

summary
footer
status