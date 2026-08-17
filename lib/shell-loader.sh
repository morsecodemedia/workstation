#!/usr/bin/env bash

################################################################################
# Shell Loader
################################################################################

LIB_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Shell Adapters
################################################################################

# shellcheck source=shell/navigation.sh
# shellcheck disable=SC1091
source "${LIB_DIR}/shell/navigation.sh"

# shellcheck source=shell/editor.sh
# shellcheck disable=SC1091
source "${LIB_DIR}/shell/editor.sh"

# shellcheck source=shell/history.sh
# shellcheck disable=SC1091
source "${LIB_DIR}/shell/history.sh"

# Future:
#
# shell/search.sh
# shell/aliases.sh