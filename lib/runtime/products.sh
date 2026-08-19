#!/usr/bin/env bash

################################################################################
# Runtime Primitive
#
# Product Discovery
################################################################################

product_discovery() {

    local workstation_root="$1"

    local parent_directory
    local product_directory
    local installation_template
    local product_id
    local product_name
    local registered

    local products='[]'

    parent_directory="$(
        dirname "${workstation_root}"
    )"

    while read -r product_directory; do

        [[ -n "${product_directory}" ]] || continue

        installation_template="$(
            find "${product_directory}/config" \
                -mindepth 2 \
                -maxdepth 2 \
                -name installation.env.in \
                -print \
                2>/dev/null \
                | head -1
        )"

        [[ -n "${installation_template}" ]] || continue

        product_id="$(
            basename "$(dirname "${installation_template}")"
        )"

        product_name="$(
            printf "%s\n" "${product_id}" \
                | sed 's/-/ /g'
        )"

        registered=false

        if [[ -f "${HOME}/.config/${product_id}/installation.env" ]]; then
            registered=true
        fi

        products="$(
            jq \
                --arg id "${product_id}" \
                --arg name "${product_name}" \
                --arg path "${product_directory}" \
                --argjson registered "${registered}" \
                '
                . + [{
                    id: $id,
                    name: $name,
                    path: $path,
                    registered: $registered
                }]
                ' <<< "${products}"
        )"

    done < <(
        find "${parent_directory}" \
            -mindepth 1 \
            -maxdepth 1 \
            -type d
    )

    printf "%s\n" "${products}"

}