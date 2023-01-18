#!/usr/bin/env bash

#Was it Rufus? script for Pronot.ai
#reference used: https://www.taniarascia.com/how-to-create-and-use-bash-scripts/

who="World"
echo "Hello, $who!"

#Get current branch status using rev-parse

activeBranch=$(git rev-parse --abbrev-ref HEAD) 
echo "active branch: $activeBranch"

#Wheter repository files have been moified

branchStatus=$(git status --porcelain)
if [ -z "$branchStatus" ]
then
	echo "local changes: True"
else
	echo "local changes: False"
fi

#Whether the current head commit was authored in the last week
#reference: https://manpages.ubuntu.com/manpages/xenial/man1/date.1.html
#seconds in 1 week = 604800

timeOfCommit=$(git log -1 --date=unix --format=%ad)
currentTime=$(date +%s)
#how to get difference
timeSince=$((currentTime - timeOfCommit))
if [ $timeSince -lt 604800 ]
then
	echo "recent commit: True"
else
	echo "recent commit: False"
fi