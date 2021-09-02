#!/bin/bash

echo "Building and installing a dwm system for user $USER into $HOME"
printf "Continue? (y/n): "
read con
if [ "$con" != "y" ] && [ "$con" != "Y" ]; then
	echo "Exiting..." && exit
fi
sleep 3

echo "Creating basic directories..."

### creating dirs like "Pictures", "Downloads" etc.
xdg-user-dirs-update

### creating dirs
mkdir $HOME/.config/
mkdir $HOME/GitRepos/

echo "Copying configuration files (/etc/, /usr/, ~/.config, etc.)..."

### copying files
sudo rsync -a -v etc/ /etc/

### copying wallpaper
sudo rsync -a -v wallpapers/ /usr/share/wallpapers/
rsync -a -v wallpapers $HOME/

### copying configs
rsync -a -v .xinitrc $HOME/
rsync -a -v .config/ $HOME/.config/

# Copying /usr/ for custom scripts
sudo rsync -a -v usr/local/bin/ /usr/local/bin/
sudo chmod +x /usr/local/bin/*

echo "Installing packages..."

### Update
sudo apt update && sudo apt upgrade -y

### installing packages and default applications
sudo apt install -y libx11-dev libxft-dev libxinerama1 libxinerama-dev network-manager curl wget apt-transport-https dirmngr rsync dmenu python3 autoconf suckless-tools xorg software-properties-common cmake fonts-font-awesome fonts-roboto devscripts file-roller feh build-essential gtk2-engines-murrine gtk2-engines vim caca-utils highlight atool w3m poppler-utils mediainfo compton python3-pip libcanberra-gtk-module libgtk2.0-dev libgtk-3-dev gnome-devel imagemagick nnn tig arandr htop mesa-utils mesa-utils-extra emacs xsel bluez-cups blueman gpick tree ninja-build gettext libtool-bin g++ unzip firmware-linux-nonfree firmware-iwlwifi jq firmware-realtek nmap thunderbird ack neofetch crda net-tools rofi

echo "Installing main Applications..."

bash installations/install_applications.sh

echo "Done installing main Applications"

echo "Running final steps..."

cd $SCRIPTPATH

### Git env
git config --global user.email "Felixs.Developer@tutanota.com"
git config --global user.name "FancyChaos"

### Fix broken packages for good measure (why not?)
sudo apt install -f -y

### Deactivate systemd-networkd for good measure
sudo systemctl disable systemd-networkd.service
sudo systemctl enable NetworkManager.service

### Disable webcam by default
### Toogle back on with 'sudo modprobe uvcvideo'
# sudo modprobe -r uvcvideo

### Boot into command line
sudo systemctl set-default multi-user.target

# Safety: Make custom scripts executable again
chmod +x /usr/local/bin/*

echo "Installation done..."
sleep 1
echo "Please reboot your system"
