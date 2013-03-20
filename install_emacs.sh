#!/bin/bash
apt-get update -yq;
apt-get dist-upgrade -yq;
apt-get update -yq;
apt-get upgrade -yq;
apt-get install -qy;
apt-get purge emacs-snapshot-common emacs-snapshot-bin-common emacs-snapshot emacs-snapshot-el emacs-snapshot-gtk emacs23 emacs23-bin-common emacs23-common emacs23-el emacs23-nox emacs23-lucid auctex emacs24 emacs24-bin-common emacs24-common emacs24-common-non-dfsg -yq;
add-apt-repository ppa:cassou/emacs -y;
apt-get update -yq;
apt-get install emacs24 emacs24-el emacs24-common-non-dfsg -yq;
apt-get install emacs-goodies-el -yq;
