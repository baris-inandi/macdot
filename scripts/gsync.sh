#!/bin/bash

source ~/me/macdot/scripts/color.sh

if [ -z "$1" ]; then
  printf "${bold}${blue}GSYNC: No commit message. Just pushing repo.\n${normal}${white}"
  git push
  exit 0
else
  cm="$@"
fi

printf "${bold}${blue}GSYNC: Syncing commit \"$cm\"\n${normal}${white}"
printf "${bold}${blue}GSYNC: Adding all changes...\n${normal}${white}"
git add -A

printf "${bold}${blue}GSYNC: Committing...\n${normal}${white}"
git commit -am "$cm"

printf "${bold}${blue}GSYNC: Pushing...\n${normal}${white}"
git push

url="$(git config --get remote.origin.url)"

printf "\n${bold}${green}REPO SYNCED at${normal}${white} $url\n"
