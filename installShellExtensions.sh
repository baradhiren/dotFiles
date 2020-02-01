#!/usr/bin/bash

# This script will install all necessary shell extensions for the dotFiles to work
# As the dotFiles might have some dependent aliases on these extensions.

###############################
# Installing zsh
###############################
sudo apt install zsh

###############################
# Installing ohmyzsh
###############################
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

###############################
# Powerlevel10k
###############################
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
# Set powerlevel10k as zsh theme
sed -i -e '/ZSH_THEME/s/"\([^"]*\)"/\"powerlevel10k\/powerlevel10k\"/' ~/.zshrc

###############################
# navi cheatsheet tool
###############################
plugins_dir="$ZSH_CUSTOM/plugins"
mkdir -p "$plugins_dir"
cd "$plugins_dir"
git clone https://github.com/denisidoro/navi

###############################
# zsh-autosuggestions
###############################
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Add navi to plugins list in zshrc
# TODO: add sed code to manipulate plugins string


###############################
# Installing fzf
###############################
sudo apt-get install fzf