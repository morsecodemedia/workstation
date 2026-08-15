#!/usr/bin/env bash

################################################################################
# Runtime Environment
################################################################################

runtime_environment_initialize() {

    info "HOMEBREW"
    runtime_homebrew_initialize

    info "XDG"
    runtime_xdg_initialize

    info "ENVIRONMENT"
    runtime_environment_variables_initialize

    info "PATH"
    runtime_environment_path_initialize

    info "NODE"
    runtime_node_initialize

    info "HISTORY"
    runtime_history_initialize

    info "SHELL"
    runtime_shell_initialize

    info "RUNTIME ALIASES"
    runtime_aliases_initialize

}

################################################################################
# Homebrew
################################################################################

runtime_homebrew_initialize() {

    if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

}

################################################################################
# PATH
################################################################################

runtime_environment_path_initialize() {

    runtime_path_initialize

}

runtime_environment_variables_initialize() {

    export TZ="America/New_York"
    export LANG="en_US.UTF-8"
    export LC_TIME="en_GB.UTF-8"

    export ZPOOL_VDEV_NAME_PATH=YES

    export SSH_ENV="$HOME/.ssh/environment"
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
    export SSH_KEY_LOCATIONS="${HOME}/.ssh/ ${HOME}/keys/personal/ssh/ ${HOME}/keys/work/ssh/"

    export TODO="${HOME}/Documents/todo"
    export NOTE_DIR="${HOME}/Documents/notes"

    umask 0022

}