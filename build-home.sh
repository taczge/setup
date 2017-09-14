#!/bin/bash

set -eu

#
# $HOME
#  |- bin ........... (from github)
#  |- opt
#  +- etc
#      |- dot ....... (from github)
#      |- setup ..... (from github)
#      +- exports

# ~/bin
cd $HOME
[ ! -d $HOME/bin ] && git clone https://github.com/taczge/bin.git

# ~/opt
mkdir -p $HOME/opt

# ~/etc
mkdir -p $HOME/etc
cd $HOME/etc
[ ! -d dotfiles ] && git clone https://github.com/taczge/dotfiles.git
[ ! -d setup ] && git clone https://github.com/taczge/setup.git
mkdir exports
