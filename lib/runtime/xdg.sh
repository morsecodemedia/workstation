#!/usr/bin/env bash

runtime_xdg_initialize() {

  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_CACHE_HOME="${HOME}/.cache"
  export XDG_DATA_HOME="${HOME}/.local/share"
  export XDG_RUNTIME_DIR="/tmp/xdg_runtime"

  export CURL_HOME="${XDG_CONFIG_HOME}/curl"

  export LESSHISTFILE="${XDG_CONFIG_HOME}/less/history"
  export LESSKEY="${XDG_CONFIG_HOME}/less/keys"

  export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/config"
  export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
  export NPM_CONFIG_TMP="${XDG_RUNTIME_DIR}/npm"

  export CALCHISTFILE="${XDG_DATA_HOME}/calc_history"

  export DOTREMINDERS="${XDG_CONFIG_HOME}/remind/reminders"

  # shellcheck disable=SC2016
  export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

}