#!/bin/bash

# Get endless sudo permissions
while true
do
	sudo -v
	sleep 10
done &

echo "Building and installing a dwm system for user $USER into $HOME"

echo "Copying configuration files (/etc/, ~/.config, etc.)..."

### creating dirs
mkdir $HOME/.config/
mkdir $HOME/GitRepos/

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
sudo apt install -y $(cat $SCRIPTPATH/packets)

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

### Deactivate systemd-networkd for good measure
sudo systemctl disable systemd-networkd.service
sudo systemctl enable NetworkManager.service

### Cleanup
sudo apt autoremove -y
sudo apt remove python-is-python2 -y
sudo ln -s $(which python3) /usr/local/bin/python

sudo systemctl disable unattended-upgrades.service
sudo systemctl disable cups.service
sudo systemctl disable exim4.service
sudo systemctl disable bluetooth.service
sudo systemctl disable blueman-mechanism.service

# Disable tracker (Data indexing for GNOME mostly)
systemctl --user mask tracker-store.service tracker-miner-fs.service tracker-miner-rss.service tracker-extract.service tracker-miner-apps.service tracker-writeback.service
systemctl --user mask gvfs-udisks2-volume-monitor.service gvfs-metadata.service gvfs-daemon.service

### Disable webcam by default
### Toogle back on with 'sudo modprobe uvcvideo'
# sudo modprobe -r uvcvideo

### Boot into command line
sudo systemctl set-default multi-user.target

### Done
echo "Installation done"
sudo reboot

