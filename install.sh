#!/bin/bash

echo "Building and installing a dwm system for user $USER into $HOME"

echo "Copying configuration files (/etc/, /usr/, ~/.config, etc.)..."

### creating dirs
mkdir $HOME/.config/
mkdir $HOME/GitRepos/

### copying files
sudo rsync -avr etc/ /etc/

### copying wallpaper
#sudo rsync -avr wallpapers/ /usr/share/wallpapers/
#rsync -avr wallpapers $HOME/

### copying configs
rsync -av .xinitrc $HOME/
rsync -avr .config/ $HOME/.config/

# Copying /usr/ for custom scripts
sudo rsync -avr usr/local/bin/ /usr/local/bin/
sudo chmod +x /usr/local/bin/*

echo "Installing packages..."

### Update
sudo apt update && sudo apt upgrade -y

### installing packages and default applications
sudo apt install -y libx11-dev libxft-dev libxinerama1 libxinerama-dev network-manager curl wget apt-transport-https dirmngr rsync dmenu python3 autoconf suckless-tools xorg software-properties-common cmake fonts-font-awesome fonts-roboto devscripts file-roller feh build-essential gtk2-engines-murrine gtk2-engines vim caca-utils highlight atool w3m poppler-utils mediainfo compton python3-pip libcanberra-gtk-module libgtk2.0-dev libgtk-3-dev gnome-devel imagemagick nnn tig arandr htop mesa-utils mesa-utils-extra emacs xsel bluez-cups blueman gpick tree ninja-build gettext libtool-bin g++ unzip jq nmap thunderbird ack neofetch crda net-tools rofi

echo "Installing main Applications..."

bash installations/install_applications.sh

echo "Done installing main Applications"

echo "Running final steps..."

cd $SCRIPTPATH

### creating dirs like "Pictures", "Downloads" etc.
xdg-user-dirs-update

### Git env
git config --global user.email "Felixs.Developer@tutanota.com"
git config --global user.name "FancyChaos"

### Fix broken packages for good measure (why not?)
sudo apt install -f -y

### Deactivate systemd-networkd for good measure
sudo systemctl disable systemd-networkd.service
sudo systemctl enable NetworkManager.service

### Cleanup
sudo systemctl disable unattended-upgrades.service

### Disable webcam by default
### Toogle back on with 'sudo modprobe uvcvideo'
# sudo modprobe -r uvcvideo

### Boot into command line
sudo systemctl set-default multi-user.target

### Done
echo "Installation done"
sudo reboot

