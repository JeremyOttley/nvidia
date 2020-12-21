#!/usr/bin/env bash

set -e
set -x

cd ~

sudo apt-get check && sudo apt-get update && sudo apt-get autoremove --purge && sudo apt-get autoclean
sudo apt-get -y install build-essential git make nmap zsh curl libssl-dev libreadline-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
sudo apt-get -y install autoconf automake unattended-upgrades clang apt-transport-https samba fonts-hack-ttf libxtf-dev libx11-dev xorg-dev libxinerama-dev libharfbuzz-dev gnupg2
sudo apt-get -y install vifm rtv newsboat

git config --global user.name "jeremyottley"
git config --global user.email "jeremy.ottley@gmail.com"
git config --global core.autocrlf input
git config --global core.safecrlf true
git config --system core.editor vim


curl -sLf https://spacevim.org/install.sh | bash


# install prereqs
# ttf-joypixels

function gitlab() {
  git clone https://gitlab.com/dwt1/$1.git
}

mkdir ~/bin/
mkdir -p ~/Pictures/Wallpapers

# Git Clone from Gitlab

gitlab wallpapers
sudo cp -r wallpapers/* /usr/share/wallpapers/

gitlab dotfiles
cp -r ~/dotfiles/.local/ ~/.local
cp -r ~/dotfiles/.dmenu ~/.dmenu
cp -r ~/dotfiles/.surf ~/.surf
cp -r ~/dotfiles/.config/picom ~/.config/picom
cp -r ~/dotfiles/.config/rofi ~/.config/rofi
cp -r ~/dotfiles/.config/vifm ~/.config/vifm
rm -rf ~/dotfiles

gitlab shell-color-scripts ~/bin/shell-color-scripts
cd shell-color-scripts
rm -rf /opt/shell-color-scripts || return 1
sudo mkdir -p /opt/shell-color-scripts/colorscripts || return 1
sudo cp -rf colorscripts/* /opt/shell-color-scripts/colorscripts
sudo cp colorscript.sh /usr/bin/colorscript


gitlab tabbed-distrotube
cd ~/bin/tabbed-distrotube
sudo make clean install
cd ~/bin

gitlab dwm-distrotube
cd ~/bin/dwm-distrotube
sudo make clean install
wget https://raw.githubusercontent.com/JeremyOttley/dwm/master/utils/backup_config
cd ~/bin

gitlab dmenu-distrotube
cd ~/bin/dmenu-distrotube
sudo make clean install
cd ~/bin

gitlab st-distrotube
cd ~/bin/st-distrotube
sudo make clean install
cd ~/bin

gitlab dwmblocks-distrotube
cd ~/bin/dwmblocks-distrotube
gcc dwmblocks.c -lX11 -o dwmblocks
cd ~/bin

gitlab surf-distrotube
cd ~/bin/surf-distrotube

#mkdir ~/.fonts
#cd ~/.fonts
#wget https://drive.google.com/u/0/uc?export=download&confirm=KPsu&id=1cditOi_aNK08oROzUJAd3i80pZZ0me4O
#unzip joypixels-6.1-free-fonts.zip
#mv -v *.zip ~/bin/
#cd ~

# xinitrc and/or desktop file

