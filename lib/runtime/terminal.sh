#!/usr/bin/env bash

# shellcheck disable=SC2034

################################################################################
# Runtime Terminal
################################################################################

runtime_terminal_initialize() {

    export LSCOLORS="gxfxcxdxbxggedabagacad"

    export CLICOLOR=1

    export TERM="screen-256color"

    export COLORTERM="truecolor"

    LESS_TERMCAP_mb="$(tput bold; tput setaf 2)"
    export LESS_TERMCAP_mb
    LESS_TERMCAP_md="$(tput bold; tput setaf 4)"
    export LESS_TERMCAP_mb
    LESS_TERMCAP_me="$(tput sgr0)"
    export LESS_TERMCAP_mb
    LESS_TERMCAP_so="$(tput bold; tput setaf 7; tput setab 4)"
    export LESS_TERMCAP_mb
    LESS_TERMCAP_se="$(tput rmso; tput sgr0)"
    export LESS_TERMCAP_mb
    LESS_TERMCAP_us="$(tput smul; tput bold; tput setaf 9)"
    export LESS_TERMCAP_mb
    LESS_TERMCAP_ue="$(tput rmul; tput sgr0)"
    export LESS_TERMCAP_mb
    LESS_TERMCAP_mr="$(tput rev)"
    export LESS_TERMCAP_mb
    LESS_TERMCAP_mh="$(tput dim)"
    export LESS_TERMCAP_mb
    LESS_TERMCAP_ZV="$(tput rsubm)"
    export LESS_TERMCAP_mb
    LESS_TERMCAP_ZW="$(tput rsupm)"
    export LESS_TERMCAP_mb

    export GROFF_NO_SGR=1

}