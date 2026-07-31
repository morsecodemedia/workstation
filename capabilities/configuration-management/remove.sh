#!/usr/bin/env bash

#
# Configuration Management
#
# Operation:
#   Remove
#
# Purpose:
#   Remove Workstation-managed configuration from the user's environment.
#
# This operation intentionally mirrors deploy.sh and preserves
# behavioral parity with the legacy implementation during the
# extraction phase.
#

source "$(dirname "${BASH_SOURCE[0]}")/../../lib/runtime.sh"

remove_path () {
  local path="$1"
  if [ -d "${REPO_ROOT}/${path}" ]; then
    pushd "${REPO_ROOT}/${path}" || return
    for f in *; do
      local newpath="${path}/${f}"
      remove_path "${newpath}"
    done
    popd || return
    if [ -z "$(ls -A "${HOME}/${path}")" ]; then
      rmdir "${HOME}/${path}"
      printf "Removing empty directory: %s\\n" "${HOME}/${path}"
    fi
  else
    if [ -L "${HOME}/${path}" ]; then
      unlink "${HOME}/${path}"
      printf "Removing: %s\\n" "${HOME}/${path}"
    fi
  fi
}

for x in *; do
  if [ "$x" != ".git" ] && [ "$x" != "." ] && [ "$x" != ".." ] && [ "$x" != "install.sh" ]&& [ "$x" != "uninstall.sh" ] && [ "$x" != "README.md" ]; then
    remove_path "$x"
  fi
done
