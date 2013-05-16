#!/bin/bash
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "monospace 10"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font --type bool false
gconftool-2 --set /apps/gnome-terminal/global/use_menu_accelerators --type bool false
gconftool-2 --set /apps/gnome-terminal/global/use_mnemonics --type bool false
gconftool-2 --set /apps/gnome-terminal/keybindings/help --type string "disabled"
