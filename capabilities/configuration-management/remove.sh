#!/usr/bin/env bash

SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

ROOT="$(
    cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 || exit
    pwd
)"

# shellcheck source=../../lib/runtime.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/runtime.sh"

parse_args "$@"

remove_path() {

    local path="$1"

    if [[ -d "${CONFIG_ROOT}/${path}" ]]; then

        pushd "${CONFIG_ROOT}/${path}" >/dev/null || return

        shopt -s nullglob

        for file in *; do
            remove_path "${path}/${file}"
        done

        shopt -u nullglob

        popd >/dev/null || return

        if [[ -d "${HOME}/${path}" ]] &&
           [[ -z "$(ls -A "${HOME}/${path}")" ]]; then

            run rmdir "${HOME}/${path}"
            info "RMDIR    ${HOME}/${path}"

        fi

        return
    fi

    local target="${HOME}/${path}"

    if [[ -L "$target" ]]; then

        run unlink "$target"
        info "REMOVE   $target"

    else

        info "MISSING  $target"

    fi

}

if ! walk_configuration remove_path; then
    info "Configuration root is empty."
fi