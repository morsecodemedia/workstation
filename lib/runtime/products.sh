#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Product Discovery
################################################################################

runtime_products_discover() {

    local workstation_root="$1"

    local parent_directory
    local repository
    local template
    local product_id
    local manifest
    local registered
    local name
    local root

    local products='[]'

    parent_directory="$(
        dirname "${workstation_root}"
    )"

    while read -r repository; do

        [[ -d "${repository}/config" ]] || continue

        template="$(
            find "${repository}/config" \
                -mindepth 2 \
                -maxdepth 2 \
                -name installation.env.in \
                -print \
                2>/dev/null \
                | head -1
        )"

        [[ -n "${template}" ]] || continue

        product_id="$(
            basename "$(dirname "${template}")"
        )"

        manifest="${HOME}/.config/${product_id}/installation.env"

        registered=false

        name="${product_id}"
        root="${repository}"

        if [[ -f "${manifest}" ]]; then

            # shellcheck disable=SC1090
            source "${manifest}"

            registered=true

            name="${PRODUCT_NAME}"
            root="${PRODUCT_ROOT}"

        fi
        
        products="$(
            jq \
                --arg id "${product_id}" \
                --arg name "${name}" \
                --arg root "${root}" \
                --argjson registered "${registered}" \
                '
                . + [{
                    id: $id,
                    name: $name,
                    root: $root,
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