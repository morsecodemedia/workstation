#!/usr/bin/env bash

catalog_packages() {

    local catalog="$1"

    jq '.packages' "${catalog}"

}