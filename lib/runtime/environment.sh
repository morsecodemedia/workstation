#!/usr/bin/env bash

################################################################################
# Runtime Environment
################################################################################

runtime_environment_initialize() {

    #
    # Platform
    #
    runtime_homebrew_initialize

    #
    # Environment
    #
    runtime_environment_variables_initialize

    runtime_xdg_initialize

    #
    # Runtime
    #
    runtime_path_initialize

    runtime_node_initialize

    #
    # Interactive Shell
    #
    runtime_history_initialize

    runtime_shell_initialize

    runtime_aliases_initialize

    runtime_terminal_initialize

    runtime_prompt_initialize

}

################################################################################
# Homebrew
################################################################################

runtime_homebrew_initialize() {

    if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

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