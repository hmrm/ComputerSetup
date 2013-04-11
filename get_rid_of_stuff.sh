#!/bin/bash
sudo rm -rf ~/.local/share/ubuntuone
rm -rf ~/.cache/ubuntuone
rm -rf ~/.config/ubuntuone
rm ~/Ubuntu\ One
sudo apt-get purge ubuntuone-client rhythmbox aisleriot gnome-mahjongg gnome-sudoku gnomine unity thunderbird gwibber totem empathy remmina unity-lens-shopping unity-scope-video-remote unity-scope-musicstores shotwell -yq
