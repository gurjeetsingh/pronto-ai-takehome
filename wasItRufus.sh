#!/usr/bin/env bash

#Was it Rufus? script for Pronot.ai take home
#Name: Gurjeet Singh Gill
#Email: gurjeetsg1@gmail.com
#LinkedIn: https://www.linkedin.com/in/gurjeetsinghgill/
#references used: https://www.taniarascia.com/how-to-create-and-use-bash-scripts/

git_dir=$1

#switch to the git directory provided
cd $git_dir


#Get current branch status using rev-parse
#references used: https://git-scm.com/docs/git-rev-parse
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
#reference used: https://manpages.ubuntu.com/manpages/xenial/man1/date.1.html
#reference used: https://git-scm.com/docs/git-log
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


#Whether the current head commit was authored by Rufus
lastAuthor=$(git log -1 --format=%an)
if [ "$lastAuthor" == "Rufus" ]
then
	echo "blame Rufus: True"
else 
	echo "blame Rufus: False"
fi
#changed to by Rufus