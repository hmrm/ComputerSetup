#!/bin/bash
su $1 -c "gsettings set org.gnome.desktop.background picture-uri file://`pwd`/media/SimpleUbuntu.png"
