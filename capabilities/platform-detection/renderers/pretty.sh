#!/usr/bin/env bash

jq -r '
"Platform Detection",
"",
"OS:            \(.platform.os)",
"Distribution:  \(.platform.distribution)",
"Version:       \(.platform.version)",
"Architecture:  \(.platform.architecture)",
"",
"Environment",
"",
"Shell:         \(.environment.shell)",
"User:          \(.environment.user)",
"Home:          \(.environment.home)"
'