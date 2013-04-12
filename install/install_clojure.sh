#!/bin/bash
#install leiningen
wget https://raw.github.com/technomancy/leiningen/stable/bin/lein
mkdir ~/bin
mv lein ~/bin
chmod a+x ~/bin/lein
PATH=$PATH:~/bin
lein repl :headless &
