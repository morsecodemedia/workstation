#!/usr/bin/env bash

################################################################################
# Configuration Runtime
################################################################################

configuration_target() {

    local path="$1"

    case "${path}" in

        git/*)
            printf "%s\n" "${HOME}/.config/${path}"
            ;;

        kitty/*)
            printf "%s\n" "${HOME}/.config/${path}"
            ;;

        tmux/*)
            printf "%s\n" "${HOME}/.config/${path}"
            ;;

        vim/*)
            printf "%s\n" "${HOME}/.config/${path}"
            ;;

        profile)
            printf "%s\n" "${HOME}/.profile"
            ;;

        curl/*)
            printf "%s\n" "${HOME}/.config/${path}"
            ;;

        asciinema/*)
            printf "%s\n" "${HOME}/.config/${path}"
            ;;

        mpv/*)
            printf "%s\n" "${HOME}/.config/${path}"
            ;;

        *)
            printf "%s\n" "${HOME}/${path}"
            ;;

    esac

}