#!/bin/bash
sudo apt-get install curl wget dpkg gnome-shell -yq
cp new_dircolors ~/.dircolors
gsettings set org.gnome.desktop.background picture-uri file://`pwd`/SimpleUbuntu.png
