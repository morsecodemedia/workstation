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

        ########################################################################
        # Generated Artifacts
        #
        # installation.env.in is consumed by the Platform Registration
        # capability and generates ~/.config/workstation/installation.env.
        # It is intentionally excluded from Configuration Management.
        ########################################################################
        workstation/installation.env.in)
            printf "%s\n" ""
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