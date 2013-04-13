#!/bin/bash
sudo apt-get install ghc ghc-prof ghc-doc cabal-install haskell-doc -yq
cabal update
PATH=$PATH:~/.cabal/bin
cabal install happy alex
cabal install hlint ghc-mod
