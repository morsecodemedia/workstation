#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/../../lib/runtime.sh"

parse_args "$@"

deploy_path() {

    local path="$1"

    if [[ -d "${CONFIG_ROOT}/${path}" ]]; then

        run mkdir -p "${HOME}/${path}"

        pushd "${CONFIG_ROOT}/${path}" >/dev/null || return

        shopt -s nullglob

        for file in *; do
            deploy_path "${path}/${file}"
        done

        shopt -u nullglob

        popd >/dev/null || return

        return
    fi

    local source="${CONFIG_ROOT}/${path}"
    local target="${HOME}/${path}"

    if [[ -L "$target" ]]; then

        run ln -sfn "$source" "$target"
        info "UPDATE   $target"

    elif [[ -e "$target" ]]; then

        info "SKIP     $target"

    else

        run ln -sfn "$source" "$target"
        info "LINK     $target"

    fi
}

if ! walk_configuration deploy_path; then
    info "Configuration root is empty."
fi