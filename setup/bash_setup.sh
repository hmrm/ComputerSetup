#!/bin/bash
#TODO: decide if I like semicolons in bash

#Deploy dotfiles
cd dotfiles
for F in `ls`;
do
    if [[ `echo $F | grep "^DOT"` != "" ]];
    then
        cp -v $F ~/`echo $F | sed s/^DOT/./`;
    fi;
done
cd ..

#wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors;
cp -r git-prompt ~

cd git-prompt
sudo make
sudo make install
cd ..
