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
    "s|{{WORKSTATION_ROOT}}|${ROOT}|g" \
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