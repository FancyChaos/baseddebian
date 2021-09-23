#!/bin/sh

### This script is for executing the main script and logging its output

### Start sudo session (will last 15minutes)
echo "Enter sudo password"
sudo echo ""

if [ "$?" != "0" ]; then
	exit
fi

### Get path of script
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
export SCRIPTPATH

### Install essentials if they are not yet installed
sudo apt install -y coreutils build-essential rsync wget curl bash

cd $SCRIPTPATH

# Make sure everything is executable
chmod +x installations/*
chmod +x install.sh

### Execute the main script
bash $SCRIPTPATH/install.sh | tee $SCRIPTPATH/install.log
