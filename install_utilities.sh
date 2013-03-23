#!/bin/bash
sudo apt-get install curl wget dpkg gnome-shell ack-grep graphviz w3m build-essential gcc libc6-dev autoconf sqlite3 m4 libncurses-dev openssl flex bison xsltproc fop libwxgtk2.8-dev libgl1-mesa-dev libglu1-mesa-dev libpng3 aptitude g++ gfortran open-cobol pdflatex automake re2c libtool php5 r-base-dev htop gnugo -yq
cp new_dircolors ~/.dircolors
gsettings set org.gnome.desktop.background picture-uri file://`pwd`/SimpleUbuntu.png

#chrome install
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ./google-chrome*.deb
sudo apt-get -f install

#sublime text install
sudo add-apt-repository ppa:webupd8team/sublime-text-2 
sudo apt-get update
sudo apt-get install sublime-text
