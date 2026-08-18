#!/usr/bin/env bash

################################################################################
# Shell Integration
#
# zoxide
################################################################################

command -v zoxide >/dev/null 2>&1 || return 0

eval "$(zoxide init bash)"