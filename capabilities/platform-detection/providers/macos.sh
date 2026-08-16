#!/usr/bin/env bash

platform_detect_macos() {

    local version
    version="$(sw_vers -productVersion)"

    local architecture
    architecture="$(uname -m)"

    local shell
    shell="$(basename "$SHELL")"

    local user
    user="$(id -un)"

    cat <<EOF
{
  "schema": "platform-description/v1",
  "platform": {
    "os": "macos",
    "distribution": "darwin",
    "version": "${version}",
    "architecture": "${architecture}"
  },
  "environment": {
    "shell": "${shell}",
    "user": "${user}",
    "home": "${HOME}"
  },
  "warnings": []
}
EOF

}