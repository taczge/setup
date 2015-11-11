#!/bin/sh -uexv

readonly SRC_URL="http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-24.5.tar.xz"

readonly TMP_DIR="$HOME/tmp"
readonly SRC_DIR="$HOME/usr/src"
readonly INSTALL_DIR="$HOME/usr"

sudo apt-get install -y\
     libgtk-3-dev \
     libxpm-dev \
     libjpeg-dev \
     libgif-dev \
     libtiff-dev \
     libncurses-dev

mkdir -p $TMP_DIR $SRC_DIR
wget -nc $SRC_URL -P $TMP_DIR
tar Jvxf $TMP_DIR/$(basename $SRC_URL) -C $SRC_DIR

cd $SRC_DIR/$(basename $SRC_URL .tar.xz)
./configure --prefix=$INSTALL_DIR
make
make install

# for maigt
sudo apt install -y texinfo
