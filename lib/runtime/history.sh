#!/usr/bin/env bash

################################################################################
# Runtime History
################################################################################

runtime_history_initialize() {

    export HISTFILE="${HOME}/.history"

    export HISTTIMEFORMAT="%F %T "

    export HISTCONTROL="ignoredups"

    export HISTFILESIZE=100000

    export HISTSIZE=100000

    export HISTIGNORE="clear:keybase*:exit"

    PROMPT_COMMAND="history -a; history -r; ${PROMPT_COMMAND:-}"

}