#!/bin/bash
sudo apt-get install ghc ghc-prof ghc-doc cabal-install -yq
cabal update
cabal install hlint ghc-mod
