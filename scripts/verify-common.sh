#!/usr/bin/env bash

################################################################################
# Verification Primitives
################################################################################

PASS_COUNT=0
WARN_COUNT=0
FAIL_COUNT=0

################################################################################
# Reporting
################################################################################

pass() {

    printf "✓ %s\n" "$1"

    PASS_COUNT=$((PASS_COUNT + 1))

}

warn() {

    printf "⚠ %s\n" "$1"

    WARN_COUNT=$((WARN_COUNT + 1))

}

fail() {

    printf "✗ %s\n" "$1"

    FAIL_COUNT=$((FAIL_COUNT + 1))

}

section() {

    local title="$1"

    printf "\n%s\n" "${title}"

    printf "%s\n" \
        "$(printf "%${#title}s" "" | tr " " "-")"

}

################################################################################
# Verification Helpers
################################################################################

check_variable() {

    local variable="$1"

    if [[ -n "${!variable:-}" ]]; then
        pass "${variable}"
    else
        fail "${variable}"
    fi

}

check_command() {

    local command="$1"

    if command -v "${command}" >/dev/null 2>&1; then
        pass "${command}"
    else
        fail "${command}"
    fi

}

check_alias() {

    local alias_name="$1"

    if alias "${alias_name}" >/dev/null 2>&1; then
        pass "${alias_name}"
    else
        fail "${alias_name}"
    fi

}

check_function() {

    local function_name="$1"

    if declare -F "${function_name}" >/dev/null 2>&1; then
        pass "${function_name}"
    else
        fail "${function_name}"
    fi

}

check_path_entry() {

    local entry="$1"

    case ":${PATH}:" in

        *":${entry}:"*)
            pass "${entry}"
            ;;

        *)
            fail "${entry}"
            ;;

    esac

}

################################################################################
# Summary
################################################################################

################################################################################
# Summary
################################################################################

summary() {

    printf "\nSummary\n"
    printf "%s\n" "-------"

    local total

    total=$((PASS_COUNT + WARN_COUNT + FAIL_COUNT))

    if [[ "${FAIL_COUNT}" -gt 0 ]]; then

        printf "Result : FAIL\n"

    elif [[ "${WARN_COUNT}" -gt 0 ]]; then

        printf "Result : WARNING\n"

    else

        printf "Result : PASS\n"

    fi

    printf "\n"

    printf "Passed             : %d\n" "${PASS_COUNT}"
    printf "Warnings           : %d\n" "${WARN_COUNT}"
    printf "Failed             : %d\n" "${FAIL_COUNT}"
    printf "Total              : %d\n" "${total}"

}

################################################################################
# Status
################################################################################

status() {

    if [[ "${FAIL_COUNT}" -gt 0 ]]; then
        return 1
    fi

    return 0

}

################################################################################
# Footer
################################################################################

footer() {

    printf "\n"

    if status; then

        printf "Verification completed successfully.\n"

    else

        printf "Verification completed with failures.\n"

    fi

}