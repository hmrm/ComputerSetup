#!/bin/bash
apt-get install ghc ghc-prof ghc-doc cabal-install haskell-doc -yq
su $1
cabal update
PATH=$PATH:~/.cabal/bin
cabal install happy alex
cabal install hlint ghc-mod

