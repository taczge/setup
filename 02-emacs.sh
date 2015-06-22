#!/bin/sh -uexv

readonly SRC_URL="http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-24.5.tar.xz"

readonly WORK_DIR="/tmp"
readonly SRC_DIR="$HOME/usr/src"
readonly INSTALL_DIR="$HOME/usr/"

readonly COMPRESSED_FILE=$(basename $SRC_URL)
readonly DECOMPRESSED_FILE=$(basename $COMPRESSED_FILE .tar.xz)

sudo apt-get install -y \
     libgtk-3-dev \
     libxpm-dev \
     libjpeg-dev \
     libgif-dev \
     libtiff-dev \
     libncurses-dev

wget -nc $SRC_URL -P $WORK_DIR
mkdir -p $SRC_DIR
tar Jvxf $WORK_DIR/$COMPRESSED_FILE -C $SRC_DIR

cd $SRC_DIR/$DECOMPRESSED_FILE
./configure --prefix=$INSTALL_DIR
make
make install
