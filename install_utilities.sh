#!/bin/bash
sudo apt-get install curl wget dpkg gnome-shell ack-grep graphviz w3m build-essential gcc libc6-dev autoconf sqlite3 m4 libncurses-dev openssl flex bison xsltproc fop libwxgtk2.8-dev libgl1-mesa-dev libglu1-mesa-dev libpng3 aptitude g++ -yq
cp new_dircolors ~/.dircolors
gsettings set org.gnome.desktop.background picture-uri file://`pwd`/SimpleUbuntu.png

#chrome install
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ./google-chrome*.deb
sudo apt-get -f install
