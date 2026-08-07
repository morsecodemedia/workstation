#!/usr/bin/env bash

jq -r '

"Platform Detection",
"",
"Platform",
"--------",
"OS:            \(.platform.os)",
"Distribution:  \(.platform.distribution)",
"Version:       \(.platform.version)",
"Architecture:  \(.platform.architecture)",
"",
"Environment",
"-----------",
"Shell:         \(.environment.shell)",
"User:          \(.environment.user)",
"Home:          \(.environment.home)",
"",
if (.warnings | length) == 0 then
    "Warnings:      None"
else
    "Warnings",
    "--------",
    (.warnings[])
end

'