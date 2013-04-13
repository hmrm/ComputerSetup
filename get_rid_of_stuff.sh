#!/bin/bash
apt-get purge ubuntuone-client rhythmbox aisleriot gnome-mahjongg gnome-sudoku gnomine unity thunderbird gwibber totem empathy remmina unity-lens-shopping unity-scope-video-remote unity-scope-musicstores shotwell -yq
rm -rf /home/$1/.local/share/ubuntuone
su $1 -c "rm -rf ~/.cache/ubuntuone"
su $1 -c "rm -rf ~/.config/ubuntuone"
su $1 -c "rm -rf ~/Ubuntu\ One"
