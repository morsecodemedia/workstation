#!/usr/bin/env bash

SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

ROOT="$(
    cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 || exit
    pwd
)"

# shellcheck source=../../lib/runtime.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/runtime.sh"

parse_args "$@"

operations='[]'

record_operation() {

    local action="$1"
    local source="$2"
    local target="$3"
    local status="$4"

    local operation

    operation="$(
        jq -n \
            --arg action "${action}" \
            --arg source "${source}" \
            --arg target "${target}" \
            --arg status "${status}" '
            {
                action: $action,
                source: $source,
                target: $target,
                status: $status
            }
            '
    )"

    operations="$(
      printf '%s\n%s\n' "${operations}" "${operation}" \
        | jq -s '.[0] + [.[1]]'
    )"

}

deploy_path() {

  local path="$1"

  if [[ -d "${CONFIG_ROOT}/${path}" ]]; then

    run mkdir -p "${HOME}/${path}"

    pushd "${CONFIG_ROOT}/${path}" >/dev/null || return

    shopt -s nullglob

    for file in *; do
      deploy_path "${path}/${file}"
    done

    shopt -u nullglob

    popd >/dev/null || return

    return
  fi

  local source="${CONFIG_ROOT}/${path}"
  local target

  target="$(
    configuration_target "${path}"
  )"

  run mkdir -p "$(dirname "${target}")"

  if [[ -L "$target" ]]; then

    run ln -sfn "$source" "$target"
    status="planned"
    if ! is_dry_run; then
      status="completed"
    fi

    record_operation \
      "link" \
      "${source}" \
      "${target}" \
      "${status}"

  elif [[ -e "$target" ]]; then

    record_operation \
      "link" \
      "${source}" \
      "${target}" \
      "skipped"

  else

    run ln -sfn "$source" "$target"
    status="planned"
    if ! is_dry_run; then
      status="completed"
    fi

    record_operation \
      "link" \
      "${source}" \
      "${target}" \
      "${status}"

  fi
}

if ! walk_configuration deploy_path; then
  :
fi

mode="apply"

if is_dry_run; then
    mode="dry-run"
fi

jq -n \
    --arg mode "${mode}" \
    --argjson operations "${operations}" '
{
    schema: "configuration-state/v1",
    mode: $mode,
    operations: $operations,
    warnings: []
}
'