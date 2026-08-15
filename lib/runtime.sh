#!/usr/bin/env bash

#
# Workstation Runtime
#
# Shared runtime services used by all Workstation capabilities.
#

set -o errexit
set -o nounset
set -o pipefail

shopt -s dotglob

################################################################################
# Repository
################################################################################

SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[1]}")" >/dev/null 2>&1
    pwd
)"

REPO_ROOT="$(
    cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1
    pwd
)"

CONFIG_ROOT="${REPO_ROOT}/config"

################################################################################
# Runtime Options
################################################################################

DRY_RUN=false
VERBOSE=false
PRETTY=false
JSON=true

################################################################################
# CLI
################################################################################

parse_args() {

    while [[ $# -gt 0 ]]; do

        case "$1" in

            -n|--dry-run)
                DRY_RUN=true
                ;;

            -v|--verbose)
                VERBOSE=true
                ;;

            -p|--pretty)
                PRETTY=true
                JSON=false
                ;;

            --json)
                PRETTY=false
                JSON=true
                ;;

            *)
                printf "Unknown option: %s\n" "$1" >&2
                exit 1
                ;;

        esac

        shift

    done

}

################################################################################
# Logging
################################################################################

info() {
    printf "%s\n" "$*" >&2
}

verbose() {
    if "$VERBOSE"; then
        printf "%s\n" "$*" >&2
    fi
}

is_pretty() {
    "$PRETTY"
}

is_json() {
    "$JSON"
}

is_dry_run() {
    "$DRY_RUN"
}

is_verbose() {
    "$VERBOSE"
}

################################################################################
# Command Execution
################################################################################

run() {

    if "$DRY_RUN"; then

        printf "[DRY RUN]" >&2

        for arg in "$@"; do
            printf " %q" "$arg" >&2
        done

        printf "\n" >&2

    else

        "$@"

    fi

}

################################################################################
# Runtime Primitives
################################################################################

RUNTIME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=runtime/editor.sh
source "${RUNTIME_DIR}/runtime/editor.sh"

# shellcheck source=runtime/preview.sh
source "${RUNTIME_DIR}/runtime/preview.sh"

# shellcheck source=runtime/finder.sh
source "${RUNTIME_DIR}/runtime/finder.sh"

# shellcheck source=runtime/selector.sh
source "${RUNTIME_DIR}/runtime/selector.sh"

# shellcheck source=runtime/navigation.sh
source "${RUNTIME_DIR}/runtime/navigation.sh"

# shellcheck source=runtime/catalog.sh
source "${RUNTIME_DIR}/runtime/catalog.sh"

# shellcheck source=runtime/path.sh
source "${RUNTIME_DIR}/runtime/path.sh"

# shellcheck source=runtime/configuration.sh
source "${RUNTIME_DIR}/runtime/configuration.sh"

# shellcheck source=runtime/environment.sh
source "${RUNTIME_DIR}/runtime/environment.sh"

################################################################################
# Orchestration
################################################################################

# shellcheck source=orchestration.sh
source "${RUNTIME_DIR}/orchestration.sh"

################################################################################
# Configuration Traversal
################################################################################

walk_configuration() {

    local callback="$1"
    local found=false

    pushd "${CONFIG_ROOT}" >/dev/null || exit 1

    shopt -s nullglob

    for item in *; do
        found=true
        "$callback" "$item"
    done

    shopt -u nullglob

    popd >/dev/null || exit 1

    if ! "$found"; then
        return 1
    fi

    return 0
}