#!/bin/bash

echo "Enter sudo password"
sudo echo "" || exit 1

# Keep sudo cache up-to-date
while true
do
       sudo -v
       sleep 5
done &


# Get path of script
SCRIPTPATH=$(pwd -P)
export SCRIPTPATH

# Update
sudo apt-get update

# Install essentials if they are not yet installed
sudo apt-get install -y coreutils build-essential rsync wget curl bash fasttrack-archive-keyring

cd $SCRIPTPATH

# Make sure everything is executable
chmod +x installations/*

# Set defaut shell to bash
chsh -s $(which bash)

# creating dirs
mkdir $HOME/.config/ || true
mkdir $HOME/GitRepos/ || true

# copying /etc/ files
sudo rsync -avr rootfs/etc/ /etc/

# Update and upgrade here due to copied sources.list
sudo apt-get update && sudo apt-get upgrade -y

# creating dirs like "Pictures", "Downloads" etc.
xdg-user-dirs-update

# copying configs
rsync -avr rootfs/home/ $HOME/

# Make custom scripts executable (be sure)
sudo chmod -R +x /etc/fos/bin/*
sudo chmod -R +x /etc/fos/statusbar/*

# installing packages and default applications
sudo apt-get install -y $(cat $SCRIPTPATH/packages)

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
sudo apt-get install -f -y

# Deactivate systemd-networkd for good measure
sudo systemctl disable systemd-networkd.service
sudo systemctl enable NetworkManager.service

# Cleanup
sudo apt-get autoremove -y
sudo apt-get remove python-is-python2 -y || true
sudo ln -s $(which python3) /usr/local/bin/python

sudo systemctl disable unattended-upgrades.service
sudo systemctl disable cups.service
sudo systemctl disable exim4.service
sudo systemctl disable bluetooth.service
sudo systemctl disable blueman-mechanism.service

# Disable tracker (Data indexing for GNOME mostly)
systemctl --user mask tracker-store.service tracker-miner-fs.service tracker-miner-rss.service tracker-extract.service tracker-miner-apps.service tracker-writeback.service
systemctl --user mask gvfs-udisks2-volume-monitor.service gvfs-metadata.service gvfs-daemon.service

sudo systemctl disable unattended-upgrades.service
sudo systemctl disable packagekit.service packagekit-offline-update.service

# Disable webcam by default
# Toogle back on with 'sudo modprobe uvcvideo'
MP=/usr/sbin/modprobe
which modprobe && MP=$(which modprobe)
sudo $MP -r uvcvideo

# Boot into command line
sudo systemctl set-default multi-user.target

# Done
echo "Installation done"
