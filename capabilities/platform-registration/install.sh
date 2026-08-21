#!/usr/bin/env bash

################################################################################
# Platform Registration
#
# Operation:
#   Install
#
# Purpose:
#   Register this Workstation installation by generating the
#   installation manifest.
################################################################################

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

# shellcheck source=../../lib/runtime-loader.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/runtime-loader.sh"

################################################################################
# Installation
################################################################################

INSTALL_DIR="${HOME}/.config/workstation"

mkdir -p "${INSTALL_DIR}"

tempfile="$(mktemp "${INSTALL_DIR}/installation.env.XXXXXX")"

runtime_template_render \
    "${ROOT}/config/workstation/installation.env.in" \
    "${tempfile}" \
    INSTALLATION_SCHEMA="installation/v1" \
    PRODUCT_ID="workstation" \
    PRODUCT_NAME="Workstation" \
    PRODUCT_ROOT="${ROOT}" \
    PRODUCT_REPOSITORY="https://github.com/morsecodemedia/workstation.git" \
    PRODUCT_CHANNEL="development" \
    PRODUCT_VERSION="1.0.0"

mv -f "${tempfile}" "${INSTALL_DIR}/installation.env"

jq -n \
    --arg root "${ROOT}" '
{
    schema: "installation-state/v1",
    status: "installed",
    root: $root
}
'

################################################################################
# Executable Registration
################################################################################

mkdir -p "${HOME}/.local/bin"

ln -sfn \
    "${ROOT}/bin/workstation" \
    "${HOME}/.local/bin/workstation"