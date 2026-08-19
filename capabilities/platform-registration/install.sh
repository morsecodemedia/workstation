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
# Installation
################################################################################

INSTALL_DIR="${HOME}/.config/workstation"

mkdir -p "${INSTALL_DIR}"

tempfile="$(mktemp "${INSTALL_DIR}/installation.env.XXXXXX")"

sed \
    -e "s|{{INSTALLATION_SCHEMA}}|installation/v1|g" \
    -e "s|{{WORKSTATION_PRODUCT}}|workstation|g" \
    -e "s|{{WORKSTATION_ROOT}}|${ROOT}|g" \
    -e "s|{{WORKSTATION_REPOSITORY}}|https://github.com/morsecodemedia/workstation.git|g" \
    -e "s|{{WORKSTATION_CHANNEL}}|development|g" \
    -e "s|{{WORKSTATION_VERSION}}|1.0.0|g" \
    "${ROOT}/config/workstation/installation.env.in" \
    > "${tempfile}"

mv -f "${tempfile}" "${INSTALL_DIR}/installation.env"

jq -n \
    --arg root "${ROOT}" '
{
    schema: "installation-state/v1",
    status: "installed",
    root: $root
}
'