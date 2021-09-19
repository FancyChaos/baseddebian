#!/bin/bash

# Install zsh
sudo apt install zsh -y

# Set zsh as default shell (Also set SHELL in .xinitrc)
sudo chsh -s $(which zsh)

# Install oh-my-zsh
cd /tmp/
export RUNZSH=no
export CHSH=no
export KEEP_ZSHRC=yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install autocomplete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh-completion
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# Install zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# Install k
git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k

# Install spaceship theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Install autojump
cd /tmp/
git clone git://github.com/wting/autojump.git
cd autojump/
python3 install.py

