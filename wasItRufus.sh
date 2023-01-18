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
#seconds in 1 week = 

timeOfCommit=$(git log -1 --format=%cd)
currentTime=$(date +%s)
timeSince=$(currentTime - (date -d timeOfCommit +%s)) #how to get difference
echo "$timeOfCommit"
echo "$currentTime"
echo "$timeSince"