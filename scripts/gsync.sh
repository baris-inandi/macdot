#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
color=$(tput setaf 12)
red=$(tput setaf 1)
white=$(tput sgr0)

if [ -z "$1" ]; then
  echo ${bold}${red}"Please provide a commit message"${normal}${white}
  exit 1
else
  cm="$@"
fi

printf "${bold}${color}GSYNC: Syncing commit \"$cm\"\n${normal}${white}"
printf "${bold}${color}GSYNC: Adding all changes...\n${normal}${white}"
git add -A

printf "${bold}${color}GSYNC: Committing...\n${normal}${white}"
git commit -am "$cm"

printf "${bold}${color}GSYNC: Pushing...\n${normal}${white}"
git push

url="$(git config --get remote.origin.url)"

printf "${bold}${color}REPO SYNCED at${normal}${white} $url"
