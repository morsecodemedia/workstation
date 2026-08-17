#!/usr/bin/env bash

################################################################################
# Runtime Node.js
################################################################################

runtime_node_initialize() {

    export NVM_DIR="${HOME}/.config/nvm"

    if [[ -s "${NVM_DIR}/nvm.sh" ]]; then
        # shellcheck disable=SC1090
        # shellcheck disable=SC1091
        . "${NVM_DIR}/nvm.sh"
    fi

    if command -v nvm >/dev/null 2>&1; then

        if ! nvm use default >/dev/null 2>&1; then
            runtime_warn \
                "Unable to activate the default Node.js runtime."
        fi

    fi

    if [[ -s "${NVM_DIR}/bash_completion" ]]; then
        # shellcheck disable=SC1090
        # shellcheck disable=SC1091
        . "${NVM_DIR}/bash_completion"
    fi

}

################################################################################
# Project Discovery
################################################################################

runtime_node_find_nvmrc() {

    local directory

    directory="$(pwd)"

    while [[ "${directory}" != "/" ]]; do

        if [[ -f "${directory}/.nvmrc" ]]; then

            printf "%s\n" "${directory}/.nvmrc"

            return 0

        fi

        directory="$(
            dirname "${directory}"
        )"

    done

    return 1

}

################################################################################
# Project Runtime Activation
################################################################################

runtime_node_project_activate() {

    #
    # NVM is optional.
    #

    command -v nvm >/dev/null 2>&1 || return 0

    local nvmrc
    local requested_version
    local current_version
    local default_version

    nvmrc="$(
        runtime_node_find_nvmrc
    )" || true


    #
    # No project runtime.
    #

    if [[ -z "${nvmrc}" ]]; then

        default_version="$(
            nvm version default 2>/dev/null || true
        )"

        if [[ "${default_version}" == "N/A" ]] \
            || [[ -z "${default_version}" ]]; then

            runtime_warn \
                "No default Node.js runtime configured."

            return 0

        fi

        current_version="$(
            nvm current
        )"

        if [[ "${current_version}" != "${default_version}" ]]; then

            nvm use default >/dev/null 2>&1 \
                || runtime_warn \
                    "Unable to activate the default Node.js runtime."

        fi

        return 0

    fi

    requested_version="$(
        < "${nvmrc}"
    )"

    #
    # Install the project runtime if necessary.
    #

    if ! nvm version "${requested_version}" >/dev/null 2>&1; then

        nvm install "${requested_version}" >/dev/null 2>&1 \
            || {
                runtime_warn \
                    "Unable to install Node.js ${requested_version}."

                return 0
            }

    fi

    #
    # Activate the project runtime.
    #

    current_version="$(
        nvm current
    )"

    if [[ "${current_version}" != "${requested_version}" ]]; then

        nvm use "${requested_version}" >/dev/null 2>&1 \
            || runtime_warn \
                "Unable to activate Node.js ${requested_version}."

    fi

}
