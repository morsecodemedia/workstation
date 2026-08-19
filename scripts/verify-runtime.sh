#!/usr/bin/env bash

set -euo pipefail

################################################################################
# Repository
################################################################################

ROOT="$(
    cd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Verification
################################################################################

# shellcheck source=verify-common.sh
# shellcheck disable=SC1091
source "${ROOT}/scripts/verify-common.sh"

################################################################################
# Runtime
################################################################################

# shellcheck source=../lib/runtime-interactive.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/runtime-interactive.sh"

################################################################################
# Recommendations
################################################################################

RUNTIME_PACKAGES_MISSING=()


################################################################################
# Runtime Environment
################################################################################

verify_runtime_environment() {

    section "Runtime Environment"

    check_variable HOME
    check_variable LANG
    check_variable TZ

    check_variable XDG_CONFIG_HOME
    check_variable XDG_CACHE_HOME
    check_variable XDG_DATA_HOME
    check_variable XDG_RUNTIME_DIR

}

################################################################################
# Runtime PATH
################################################################################

verify_runtime_path() {

    section "Runtime PATH"

    check_path_entry "/opt/homebrew/bin"
    check_path_entry "${HOME}/bin"
    check_path_entry "${HOME}/.local/bin"

}

################################################################################
# Runtime Packages
################################################################################

verify_runtime_package() {

    local executable="$1"
    local display_name="$2"

    if command -v "${executable}" >/dev/null 2>&1; then

        pass "${display_name}"

    else

        fail "${display_name}"

        RUNTIME_PACKAGES_MISSING+=("${display_name}")

    fi

}

verify_runtime_packages() {

    section "Runtime Packages"

    verify_runtime_package git "git"
    verify_runtime_package curl "curl"
    verify_runtime_package node "node"
    verify_runtime_package npm "npm"
    verify_runtime_package rg "ripgrep"

}

################################################################################
# Runtime SDK
################################################################################

verify_runtime_sdk() {

    section "Runtime SDK"

    check_function runtime_environment_initialize
    check_function runtime_path_initialize
    check_function runtime_node_initialize
    check_function runtime_history_initialize
    check_function runtime_shell_initialize
    check_function runtime_aliases_initialize
    check_function runtime_terminal_initialize
    check_function runtime_prompt_initialize

}

################################################################################
# Recommendations
################################################################################

recommend_runtime_packages() {

    [[ ${#RUNTIME_PACKAGES_MISSING[@]} -eq 0 ]] && return

    printf "\nRecommendations\n"
    printf "%s\n" "---------------"

    printf "The Runtime package contract is not satisfied.\n\n"

    printf "Missing Runtime packages:\n"

    local package

    for package in "${RUNTIME_PACKAGES_MISSING[@]}"; do
        printf "  • %s\n" "${package}"
    done

    printf "\n"

    printf "Next Steps\n"
    printf "%s\n" "----------"

    printf "Install the missing Runtime packages.\n\n"

    printf "    workstation packages apply\n\n"

    printf "Verify the Runtime.\n\n"

    printf "    ./scripts/check.sh\n"

}

################################################################################
# Main
################################################################################

printf "\n"
printf "Runtime Verification\n"
printf "====================\n"

verify_runtime_environment

verify_runtime_path

verify_runtime_packages

verify_runtime_sdk

summary

recommend_runtime_packages

footer
status