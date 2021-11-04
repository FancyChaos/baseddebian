#!/bin/bash

# Get endless sudo permissions
while true
do
	sudo -v
	sleep 5
done &

echo "Building and installing a dwm system for user $USER into $HOME"

echo "Copying configuration files (/etc/, ~/.config, etc.)..."

### creating dirs
mkdir $HOME/.config/ || true
mkdir $HOME/GitRepos/ || true

### copying /etc/ files
sudo rsync -avr etc/ /etc/

### copying configs
rsync -avr home/ $HOME/

# Make custom scripts executable (be sure)
sudo chmod +x $HOME/.local/bin/tools/*

echo "Installing packages..."

### Update
sudo apt update && sudo apt upgrade -y

### installing packages and default applications
sudo apt install -y $(cat $SCRIPTPATH/packages)

echo "Installing main Applications..."

for install_script in $(find installations/ -type f | sort); do
	name=$(basename $install_script)
	echo "Executing $name..."
	chmod +x $install_script
	./$install_script
done

echo "Done installing main Applications"

echo "Running final steps..."

cd $SCRIPTPATH

### creating dirs like "Pictures", "Downloads" etc.
xdg-user-dirs-update

### Git env
git config --global user.email "Felixs.Developer@tutanota.com"
git config --global user.name "FancyChaos"

# Generate new ssh keys without a password
ssh-keygen -q -f $HOME/.ssh/git_key -t ecdsa -b 521 -N ""

### Fix broken packages for good measure (why not?)
sudo apt install -f -y

### Cleanup
sudo apt autoremove -y
sudo apt remove python-is-python2 -y
sudo ln -s $(which python3) /usr/local/bin/python

# Cleanup openrc services
sudo rc-update delete unattended-upgrades default

### Disable webcam by default
### Toogle back on with 'sudo modprobe uvcvideo'
sudo modprobe -r uvcvideo

### Done
echo "Installation done"
#sudo reboot
