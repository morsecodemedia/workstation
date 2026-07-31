#!/usr/bin/env bash

#
# Workstation Runtime
#
# Purpose:
#   Shared runtime initialization for Workstation capabilities.
#
# Responsibilities:
#   - Enable required shell options.
#   - Resolve the repository root.
#   - Provide quiet directory navigation helpers.
#
# This library intentionally owns only runtime concerns.
# Filesystem operations, traversal, logging, and capability
# behavior belong to higher-level capability implementations.
#

# Enable dotfiles during filesystem traversal.
shopt -s dotglob

# Resolve the repository root.
#
# NOTE:
# This assumes the calling script resides beneath the repository
# root. The repository root is determined relative to the calling
# script rather than the current working directory.
#
SCRIPT_DIR="$(
  cd "$(dirname "${BASH_SOURCE[1]}")" >/dev/null 2>&1
  pwd
)"

REPO_ROOT="$(
  cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1
  pwd
)"

# Quiet pushd/popd wrappers.
pushd() {
  command pushd "$@" >/dev/null
}

popd() {
  command popd >/dev/null
}