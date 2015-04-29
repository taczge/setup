#!/bin/sh

sudo apt-get install -y zsh
chsh -s `which zsh`

readonly ZSH_PLUGIN_DIR=$HOME/.zsh/plugin

if [ -d $ZSH_PLUGIN_DIR ]; then
    echo "[skipped]: $ZSH_PLUGIN_DIR existed"
else
    mkdir -v -p $ZSH_PLUGIN_DIR
fi

if [ -f $ZSH_PLUGIN_DIR/incr*.zsh ]; then
    echo "[skipped]: incr*.zsh existed"
else
    cd $ZSH_PLUGIN_DIR
    curl -L -O http://mimosa-pudica.net/src/incr-0.2.zsh
fi
