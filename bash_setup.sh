#!/bin/bash
#TODO: decide if I like semicolons in bash
cp -v new_bashrc.sh ~/.bashrc;
cp -v new_bash_aliases.sh ~/.bash_aliases;
cp -v new_profile.sh ~/.profile;
cp -v new_screenrc.sh ~/.screenrc
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors;
cp -r git-prompt ~
cd git-prompt
sudo make
sudo make install
cd ..
