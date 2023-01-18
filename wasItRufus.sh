#!/usr/bin/env bash

#Was it Rufus? script for Pronot.ai
#reference used: https://www.taniarascia.com/how-to-create-and-use-bash-scripts/

who="World"
echo "Hello, $who!"

#Get current branch status using rev-parse

active_branch=$(git rev-parse --abbrev-ref HEAD) 
echo "active branch: $active_branch"

#Wheter repository files have been moified

branch_status=$(git status --porcelain)
if [ -z "$branch_status" ]
then
	echo "local changes: True"
else
	echo "local changes: False"
fi
