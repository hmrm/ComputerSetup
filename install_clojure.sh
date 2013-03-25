#!/bin/bash
#install leiningen
wget https://raw.github.com/technomancy/leiningen/stable/bin/lein
mv lein ~/bin/lein
chmod a+x ~/bin/lein
PATH=$PATH:~/bin
lein repl :headless &
