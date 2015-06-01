#!/bin/sh -uexv

readonly SRC_URL="http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-24.5.tar.xz"

readonly WORK_DIR="/tmp"
readonly SRC_DIR="$HOME/usr/src"
readonly INSTALL_DIR="$HOME/usr/share"

sudo apt-get install -y \
     libgtk-3-dev \
     libxpm-dev \
     libjpeg-dev \
     libgif-dev \
     libtiff-dev \
     libncurses-dev

wget -nc $SRC_URL -P $WORK_DIR
mkdir -p $SRC_DIR
tar Jvxf $WORK_DIR/$(basename $SRC_URL) -C $SRC_DIR

cd $SRC_DIR/$(basename $SRC_URL .tar.xz)
./configure --prefix=$INSTALL_DIR
make
make install
