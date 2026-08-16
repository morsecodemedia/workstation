#!/usr/bin/env bash

################################################################################
# Shell Adapter
#
# History
################################################################################

fh() {

    local selection

    selection="$(
        history_list \
            | sed -E 's/^[[:space:]]*[0-9]+[[:space:]]*//' \
            | selector_choose
    )"

    [[ -n "${selection}" ]] || return

    printf "%s\n" "${selection}"

}