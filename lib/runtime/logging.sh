#!/usr/bin/env bash

################################################################################
# Runtime Logging
################################################################################

runtime_info() {

    printf "Workstation: %s\n" "$*" >&2

}

runtime_warn() {

    printf "Workstation: WARNING: %s\n" "$*" >&2

}

runtime_error() {

    printf "Workstation: ERROR: %s\n" "$*" >&2

}