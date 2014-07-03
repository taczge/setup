#!/bin/sh

readonly APT_GET="sudo apt-get install -y"

#
# maven
#
$APT_GET maven

#
# eclipse
#
readonly SRC_URL="http://ftp.yz.yamagata-u.ac.jp/pub/eclipse//technology/epp/downloads/release/luna/R/eclipse-standard-luna-R-linux-gtk-x86_64.tar.gz"
readonly INSTALL_DIR="/opt"
readonly TAR_FILE="`basename $SRC_URL`"

$APT_GET openjdk-7-jdk   # for Eclipse Luna requirement
wget $SRC_URL -P /tmp
sudo tar xzf /tmp/$TAR_FILE -C $INSTALL_DIR
sudo ln -sf $INSTALL_DIR/eclipse/eclipse /usr/local/bin
sudo chown -R root:root $INSTALL_DIR/eclipse
