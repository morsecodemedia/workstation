#!/usr/bin/env bash

################################################################################
# Orchestration
################################################################################

execution_state_compose() {

    [[ $# -eq 3 ]] || return 1

    local execution_state="$1"
    local key="$2"
    local artifact="$3"

    jq -n \
        --argjson execution_state "${execution_state}" \
        --arg key "${key}" \
        --argjson artifact "${artifact}" '
            $execution_state + {
                ($key): $artifact
            }
        '

}

execution_state_initialize() {

    jq -n '
        {
            schema: "execution-state/v1"
        }
    '

}