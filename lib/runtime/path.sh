#!/usr/bin/env bash

################################################################################
# Runtime PATH
################################################################################

runtime_path_add() {

    local entry="$1"

    [[ -d "${entry}" ]] || return

    case ":${PATH}:" in

        *":${entry}:"*)
            ;;

        *)
            PATH="${entry}:${PATH}"
            ;;

    esac

}

################################################################################
# PATH Initialization
################################################################################

runtime_path_initialize() {

    runtime_path_add "/opt/homebrew/bin"
    runtime_path_add "/opt/homebrew/opt/coreutils/libexec/gnubin"
    runtime_path_add "/opt/homebrew/opt/make/libexec/gnubin"
    runtime_path_add "/opt/homebrew/opt/libxml2/bin"

    runtime_path_add "${HOME}/bin"
    runtime_path_add "${HOME}/.local/bin"

    export PATH

}