#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/../../lib/runtime.sh"

parse_args "$@"

status_path() {

    local path="$1"

    if [[ -d "${CONFIG_ROOT}/${path}" ]]; then

        pushd "${CONFIG_ROOT}/${path}" >/dev/null || return

        shopt -s nullglob

        for file in *; do
            status_path "${path}/${file}"
        done

        shopt -u nullglob

        popd >/dev/null || return

        return
    fi

    local source="${CONFIG_ROOT}/${path}"
    local target="${HOME}/${path}"

    if [[ -L "$target" ]]; then

        local linked
        linked="$(readlink "$target")"

        if [[ "$linked" == "$source" ]]; then
            printf "%-10s %s\n" "DEPLOYED" "$target"
        else
            printf "%-10s %s\n" "MODIFIED" "$target"
        fi

    elif [[ -e "$target" ]]; then

        printf "%-10s %s\n" "MODIFIED" "$target"

    else

        printf "%-10s %s\n" "MISSING" "$target"

    fi

}

if ! walk_configuration status_path; then
    info "Configuration root is empty."
fi