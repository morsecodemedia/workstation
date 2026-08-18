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
# Verification
################################################################################

# shellcheck source=verify-common.sh
# shellcheck disable=SC1091
source "${ROOT}/scripts/verify-common.sh"

################################################################################
# Interactive Runtime
################################################################################

# shellcheck source=../lib/runtime-interactive.sh
# shellcheck disable=SC1091
# source "${ROOT}/lib/runtime-interactive.sh"

# shellcheck source=../shell/bash/init.sh
# shellcheck disable=SC1091
source "${ROOT}/shell/bash/init.sh"

################################################################################
# Interactive Shell
################################################################################

verify_interactive_shell() {

    section "Interactive Shell"

    check_variable EDITOR
    check_variable PAGER
    check_variable GPG_TTY

    check_variable HISTFILE
    check_variable PROMPT_COMMAND

}

################################################################################
# Interactive Aliases
################################################################################

verify_interactive_aliases() {

    section "Interactive Aliases"

    check_alias ll
    check_alias ..
    check_alias mkdir
    check_alias grep

}

################################################################################
# Interactive Navigation
################################################################################

verify_interactive_navigation() {

    section "Interactive Navigation"

    check_function fd
    check_function fda

}

################################################################################
# Interactive Editing
################################################################################

verify_interactive_editing() {

    section "Interactive Editing"

    check_function fe

}

################################################################################
# Interactive History
################################################################################

verify_interactive_history() {

    section "Interactive History"

    check_function fh

}

################################################################################
# Interactive Prompt
################################################################################

verify_interactive_prompt() {

    section "Interactive Prompt"

    check_variable PS1

}

################################################################################
# Interactive Integrations
################################################################################

verify_interactive_integrations() {

    section "Interactive Integrations"

    check_function z
    check_function zi

}

################################################################################
# Main
################################################################################

printf "Interactive Runtime Verification\n"
printf "================================\n"

verify_interactive_shell

verify_interactive_aliases

verify_interactive_navigation

verify_interactive_editing

verify_interactive_history

verify_interactive_prompt

verify_interactive_integrations

summary

status