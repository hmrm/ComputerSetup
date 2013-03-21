#!/bin/bash
cat ./new_bashrc > ~/.bashrc;
cat ./new_bash_aliases > ~/.bash_aliases;
cat ./new_profile > ~/.profile;
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors;
cd git-prompt
sudo make
sudo make install
cd ..
