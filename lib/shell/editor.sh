#!/usr/bin/env bash

################################################################################
# Shell Adapter
#
# Editor
################################################################################

fe() {

    local file

    file="$(
        finder_files "${1:-.}" \
            | selector_choose
    )"

    [[ -n "${file}" ]] || return

    editor_open "${file}"

}