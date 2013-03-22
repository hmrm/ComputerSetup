#!/bin/bash
sudo apt-get install curl wget dpkg gnome-shell ack graphviz w3m -yq
cp new_dircolors ~/.dircolors
gsettings set org.gnome.desktop.background picture-uri file://`pwd`/SimpleUbuntu.png

#chrome install
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ./google-chrome*.deb
sudo apt-get -f install
