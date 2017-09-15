#!/bin/bash

set -eu

#
# $HOME
#  |- bin ........... (from github)
#  |- etc
#  |   |- dot ....... (from github)
#  |   |- setup ..... (from github)
#  |   +- exports
#  |- opt
#  |- tmp
#  +- work
#

# ~/bin
cd "$HOME"
[ ! -d "$HOME/bin" ] && git clone https://github.com/taczge/bin.git

# ~/etc
mkdir -p "$HOME/etc"
cd "$HOME/etc"
[ ! -d dotfiles ] && git clone https://github.com/taczge/dotfiles.git
[ ! -d setup ] && git clone https://github.com/taczge/setup.git
mkdir -p exports

# other
mkdir -p "$HOME"/{opt,tmp,work}
