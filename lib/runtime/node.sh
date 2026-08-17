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