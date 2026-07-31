#!/usr/bin/env bash

#
# Configuration Management
#
# Operation:
#   Deploy
#
# Purpose:
#   Deploy repository-managed configuration into the user's environment.
#

source "$(dirname "${BASH_SOURCE[0]}")/../../lib/runtime.sh"

# recursive loop over files, creating mirrored directories and linking
# only files. Avoids accidentally adding new files to dotfiles repo
# if they are created and inserted into a symlinked directory later
deploy_path () {
  local path="$1"
  if [ -d "${REPO_ROOT}/${path}" ]; then
    pushd "${REPO_ROOT}/${path}" || return
    mkdir -p "${HOME}/${path}"
    shopt -s nullglob
    for f in *; do
      local newpath="${path}/${f}"
      deploy_path "${newpath}"
    done
    shopt -u nullglob
    popd || return
  else
    if [ -L "${HOME}/${path}" ]; then
      ln -sfn "${REPO_ROOT}/${path}" "${HOME}/${path}"
      printf "%-8s %s\n" \
        "UPDATE" \
        "${HOME}/${path}" \
        "${REPO_ROOT}/${path}"
    elif [ -e "${HOME}/${path}" ]; then
      printf "%-8s %s\n" \
        "SKIP" \
        "${HOME}/${path}"
    else
      ln -sfn "${REPO_ROOT}/${path}" "${HOME}/${path}"
      printf "%-8s %s\n" \
        "LINK" \
        "${HOME}/${path}" \
        "${REPO_ROOT}/${path}"
    fi
  fi
}

# main loop, ignoring some key files
for x in *; do
  if [ "$x" != ".git" ] &&[ "$x" != ".gitignore" ] && [ "$x" != "." ] && [ "$x" != ".." ] && [ "$x" != "install.sh" ]&& [ "$x" != "uninstall.sh" ] && [ "$x" != "README.md" ]; then
    deploy_path "$x"
  fi
done
