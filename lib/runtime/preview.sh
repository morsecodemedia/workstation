#!/usr/bin/env bash

################################################################################
# Preview Runtime Primitive
################################################################################

render_preview() {

    [[ $# -eq 1 ]] || return 1

    local target="$1"

    if command -v batcat >/dev/null 2>&1; then
        batcat \
            --theme Dracula \
            --color=always \
            "${target}"

        return
    fi

    if command -v bat >/dev/null 2>&1; then
        bat \
            --theme Dracula \
            --color=always \
            "${target}"

        return
    fi

    cat "${target}"

}