#!/bin/bash
#install leiningen
wget https://raw.github.com/technomancy/leiningen/stable/bin/lein
mkdir /home/$1/bin
mv lein /home/$1/bin
chmod a+x /home/$1/bin/lein
