#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
color=$(tput setaf 5)
white=$(tput sgr0)

if [ -z "$1" ]; then
  cm=commit
else
  cm="$1"
fi

printf "${bold}${color}GSYNC:${white} Syncing \"$cm\"\n${normal}"
printf "${bold}${color}GSYNC:${white} Adding all changes...\n${normal}"
git add -A

printf "${bold}${color}GSYNC:${white} Committing...\n${normal}"
git commit -am "$cm"

printf "${bold}${color}GSYNC:${white} Pushing...\n${normal}"
git push

printf "${bold}${color}REPO SYNCED${white}\n${normal}"
