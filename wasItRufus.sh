#!/usr/bin/env bash

#Was it Rufus? script for Pronot.ai take home
#Name: Gurjeet Singh Gill
#Email: gurjeetsg1@gmail.com
#LinkedIn: https://www.linkedin.com/in/gurjeetsinghgill/
#references used: https://www.taniarascia.com/how-to-create-and-use-bash-scripts/

#Colors reference: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

ORANGE='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

git_dir=$1

#switch to the git directory provided
cd $git_dir


#Get current branch status using rev-parse
#references used: https://git-scm.com/docs/git-rev-parse
activeBranch=$(git rev-parse --abbrev-ref HEAD) 
echo -e "active branch: ${ORANGE}$activeBranch${NC}"

#Wheter repository files have been moified
branchStatus=$(git status --porcelain)
if [ -z "$branchStatus" ]
then
	echo -e "local changes: ${BLUE}True${NC}"
else
	echo -e "local changes: ${BLUE}False${NC}"
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
	echo -e "recent commit: ${BLUE}True${NC}"
else
	echo -e "recent commit: ${BLUE}False${NC}"
fi


#Whether the current head commit was authored by Rufus
lastAuthor=$(git log -1 --format=%an)
if [ "$lastAuthor" == "Rufus" ]
then
	echo -e "blame Rufus: ${BLUE}True${NC}"
else 
	echo -e "blame Rufus: ${BLUE}False${NC}"
fi
#changed to by Rufus