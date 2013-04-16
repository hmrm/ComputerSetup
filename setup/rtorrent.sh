#!/bin/bash
echo "Where would you like to store the files downloaded by rTorrent? Please double escape your slashes and any other characters which might be problematic"
echo "for example /home/me/torrent_downloads -> \\\\/home\\\\/me\\\\/torrent_downloads"
echo ">"
read -e directory
cat dotfiles/DOTrtorrent.rc | sed 's/INSERTTORRENTDIRECTORYHERE/'$directory'/' > /home/$1/.rtorrent.rc

#locations watched for torrents
mkdir /home/$1/.torrent.d
mkdir /home/$1/.torrent.d/torrents
mkdir /home/$1/.torrent.d/nouptorrents
