#!/usr/bin/env bash

#Was it Rufus? script for Pronot.ai
#reference used: https://www.taniarascia.com/how-to-create-and-use-bash-scripts/

who="World"
echo "Hello, $who!"

#Get current branch status using rev-parse
current_branch=$(git rev-parse --abbrev-ref HEAD) 
echo "active branch: $current_branch"