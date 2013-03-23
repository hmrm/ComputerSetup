#!/bin/bash
#TODO: decide if I like semicolons in bash
cp new_bashrc.sh ~/.bashrc;
cp new_bash_aliases.sh ~/.bash_aliases;
cp new_profile.sh ~/.profile;
cp new_screenrc.sh ~/.screenrc
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors;
cd git-prompt
sudo make
sudo make install
cd ..
