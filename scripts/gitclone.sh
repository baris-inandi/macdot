#!/bin/bash

source ~/me/macdot/scripts/color.sh

cmd_base="git clone"
acc_uname="baris-inandi"
arg="$1"

# Print usage if no argument or option-like argument
if [[ -z "$arg" || "$arg" == -* ]]; then
    echo "Usage:"
    echo "  gitclone <url>"
    echo "  gitclone <repo>"
    echo "  gitclone <user/repo>"
    exit 0
fi

# Determine what kind of argument was given
if [[ "$arg" == *"://"* || "$arg" == *"git@"* ]]; then
    # Is a URL → clone directly
    cmd="${cmd_base} ${arg}"
elif [[ "$arg" == */* ]]; then
    # Is user/repo → clone from GitHub
    cmd="${cmd_base} https://github.com/${arg}"
else
    # Is just repo → clone from personal account
    cmd="${cmd_base} https://github.com/${acc_uname}/${arg}"
fi

printf "${bold}${blue}CLONING: $cmd\n${normal}${white}"
eval "$cmd"
