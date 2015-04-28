#!/bin/bash

readonly INSTALL_DIR="$HOME/opt"
readonly SRC_URL="http://ftp.yz.yamagata-u.ac.jp/pub/eclipse//technology/epp/downloads/release/luna/SR2/eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz"

cd /tmp
wget -nc $SRC_URL

mkdir -p $INSTALL_DIR
tar vxzf $(basename $SRC_URL) -C $INSTALL_DIR
