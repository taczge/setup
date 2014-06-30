#!/bin/sh -ex

APT_GET="sudo apt-get install -y"

${APT_GET} maven

#
# eclipse
#
extract_tar_gz_file_name() {
    echo $1 | sed -e 's/.*\/\(.*$\)/\1/g'
}

readonly WORK_DIR="/tmp"
readonly INSTALL_DIR="/opt"
readonly SRC_URL="http://ftp.yz.yamagata-u.ac.jp/pub/eclipse//technology/epp/downloads/release/luna/R/eclipse-testing-luna-R-linux-gtk-x86_64.tar.gz"
readonly TAR_FILE=`extract_tar_gz_file_name $SRC_URL`

$APT_GET openjdk-7-jdk   # for Eclipse Luna requirement
wget $SRC_URL -P $WORK_DIR
sudo tar xzf $WORK_DIR/$TAR_FILE -C $INSTALL_DIR
sudo ln -sf $INSTALL_DIR/eclipse/eclipse /usr/local/bin
