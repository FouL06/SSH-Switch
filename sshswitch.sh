#!/bin/bash

# SSH-SWITCH
# Description: Allows for switching of SSH Keys for those who use multiple
# Github accounts on the same machine to allow for easy clone, pull, and push commands
# via git's CLI.
# Author: Ashton Foulger
# Version: v0.1
# Date: 10/18/22

if (($# == 0)); then
	echo "Please pass in one of the following arguments -p (personal) or -w (work)"
	exit 2
fi

Personal()
{
	ssh-add -D
 	ssh-add ~/.ssh/id_rsa
 	echo "ssh key was switched to personal."
}

Work()
{
	ssh-add -D
 	ssh-add ~/.ssh/id_ed25519
 	echo "ssh key was switched to work."
}

Help()
{
	echo "Options:"
 	echo "-p	Set your ssh key to your personal Github account."
	echo "-w	Set your ssh key to your work Github account."
}

while getopts ":hpw" option; do
   case $option in
	h) Help
	   exit;;
	p) Personal
	   exit;;
	w) Work
	   exit;;
   esac
done
