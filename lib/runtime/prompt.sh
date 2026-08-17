#!/usr/bin/env bash

################################################################################
# Runtime Prompt
################################################################################

runtime_prompt_initialize() {

    local hostname
    local shell_name

    hostname="$(uname -n)"
    shell_name="$(ps -cp "$$" -o command="" 2>/dev/null)"

    if [[ -z "${shell_name}" ]] \
        || [[ "${shell_name}" == "dash" ]] \
        || [[ "${shell_name}" == "sh" ]]; then

        PS1="[${hostname}] "
        PS1="${PS1}"'$(basename "$(pwd)") '
        PS1="${PS1}-> "

    else

        local directory_color
        local pipe_color
        local prompt_color
        local host_color
        local reset_color

        directory_color="\001$(tput setaf 12)\002"
        pipe_color="\001$(tput setaf 241)\002"
        prompt_color="\001$(tput setaf 196)\002"
        host_color="\001$(tput setaf 245)\002"
        reset_color="\001$(tput sgr0)\002"

        PS1="${host_color}${hostname}"
        PS1="${PS1}${pipe_color}|"
        PS1="${PS1}${directory_color}\w"
        PS1="${PS1}\n${prompt_color}->${reset_color} "

    fi

    export PS1

}