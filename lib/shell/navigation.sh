#!/usr/bin/env bash

################################################################################
# Shell Adapter
#
# Navigation
################################################################################

fd() {

    local directory

    directory="$(
        finder_directories "${1:-.}" \
            | selector_choose
    )"

    [[ -n "${directory}" ]] || return

    navigation_cd "${directory}"

}

fda() {

    local directory

    directory="$(
        finder_directories_all "${1:-.}" \
            | selector_choose
    )"

    [[ -n "${directory}" ]] || return

    navigation_cd "${directory}"

}