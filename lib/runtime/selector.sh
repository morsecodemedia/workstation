#!/usr/bin/env bash

################################################################################
# Runtime Primitive
#
# Selector
################################################################################

selector_choose() {

    fzf +m

}

selector_choose_preview() {

    [[ $# -eq 1 ]] || return 1

    fzf \
        +m \
        --preview "$1"

}