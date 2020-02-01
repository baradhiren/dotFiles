#!/usr/bin/bash

# This script will take backup of all given dotfiles in backUpFiles

cd ${HOME}/Downloads/dotFiles/

BACKUP=${HOME}/Downloads/dotFiles/backUpFiles

timestamp() {
  date +"%d-%m-%Y at %T"
}

grep -v '^$\|^\s*\#' $BACKUP | while read -r line; do
	echo "$line" | awk '{ system("rsync " $1 " " $2) }'
done

if [[ `git status --porcelain` ]]; then
	git pull origin master
	git add .
	git commit -m "automatic update: $(timestamp)"
	git push origin master
fi