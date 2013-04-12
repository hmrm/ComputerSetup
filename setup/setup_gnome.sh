#!/bin/bash
gsettings set org.gnome.desktop.background picture-uri file://`pwd`/SimpleUbuntu.png
gconftool-2 --set /apps/gnome-terminal/global/use_menu_accelerators --type bool false
gconftool-2 --set /apps/gnome-terminal/global/use_mnemonics --type bool false
gconftool-2 --set /apps/gnome-terminal/keybindings/help --type string "disabled"

