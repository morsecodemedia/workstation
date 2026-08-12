#!/usr/bin/env bash

################################################################################
# Runtime Primitive
#
# Finder
################################################################################

finder_files() {

    local root="${1:-.}"

    find "${root}" \
        -path '*/.*' -prune \
        -o \
        -type f \
        -print \
        2>/dev/null

}

finder_files_all() {

    local root="${1:-.}"

    find "${root}" \
        -type f \
        -print \
        2>/dev/null

}

finder_directories() {

    local root="${1:-.}"

    find "${root}" \
        -path '*/.*' -prune \
        -o \
        -type d \
        -print \
        2>/dev/null

}

finder_directories_all() {

    local root="${1:-.}"

    find "${root}" \
        -type d \
        -print \
        2>/dev/null

}