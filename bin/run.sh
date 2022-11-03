#!/bin/bash

# Start doas session (will last 15minutes)
echo "Enter doas password"
doas echo "" || exit 1

# Get path of script
SCRIPTPATH=$(pwd -P)
export SCRIPTPATH

# Update
doas apt-get update

# Install essentials if they are not yet installed
doas apt-get install -y coreutils build-essential rsync wget curl bash fasttrack-archive-keyring

cd $SCRIPTPATH

# Make sure everything is executable
chmod +x installations/*

# Set defaut shell to bash
chsh -s $(which bash)

# creating dirs
mkdir $HOME/.config/ || true
mkdir $HOME/GitRepos/ || true

# copying /etc/ files
doas rsync -avr rootfs/etc/ /etc/

# Update and upgrade here due to copied sources.list
doas apt-get update && doas apt-get upgrade -y

# creating dirs like "Pictures", "Downloads" etc.
xdg-user-dirs-update

# copying configs
rsync -avr rootfs/home/ $HOME/

# Make custom scripts executable (be sure)
doas chmod -R +x /etc/fos/bin/*
doas chmod -R +x /etc/fos/statusbar/*

# installing packages and default applications
doas apt-get install -y $(cat $SCRIPTPATH/packages)

# Execute install scripts
for install_script in $(find installations/ -type f | sort); do
	name=$(basename $install_script)
	echo "Executing $name..."
	chmod +x $install_script
	./$install_script
done

cd $SCRIPTPATH

# Update tldr database
tldr -u

# Git env
git config --global user.email "Felixs.Developer@tutanota.com"
git config --global user.name "FancyChaos"

# Generate generic key for later git access
[ ! -f $HOME/.ssh/git_key ] && ssh-keygen -q -f $HOME/.ssh/git_key -t ecdsa -b 521 -N ""j

# Fix broken packages for good measure (why not?)
doas apt-get install -f -y

# Deactivate systemd-networkd for good measure
doas systemctl disable systemd-networkd.service
doas systemctl enable NetworkManager.service

# Cleanup
doas apt-get autoremove -y
doas apt-get remove python-is-python2 -y || true
doas ln -s $(which python3) /usr/local/bin/python

doas systemctl disable unattended-upgrades.service
doas systemctl disable cups.service
doas systemctl disable exim4.service
doas systemctl disable bluetooth.service
doas systemctl disable blueman-mechanism.service

# Disable tracker (Data indexing for GNOME mostly)
systemctl --user mask tracker-store.service tracker-miner-fs.service tracker-miner-rss.service tracker-extract.service tracker-miner-apps.service tracker-writeback.service
systemctl --user mask gvfs-udisks2-volume-monitor.service gvfs-metadata.service gvfs-daemon.service

# Disable webcam by default
# Toogle back on with 'doas modprobe uvcvideo'
doas modprobe -r uvcvideo

# Boot into command line
doas systemctl set-default multi-user.target

# Done
echo "Installation done"
