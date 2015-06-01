#!/bin/sh

readonly SRC_URL="https://www.yatex.org/yatex1.78.4.tar.gz"

readonly WORK_DIR="/tmp"
readonly SRC_DIR="$HOME/usr/src"
readonly PREFIX=$HOME/usr

readonly COMPRESSED_FILE=$(basename $SRC_URL)
readonly DECOMPRESSED_FILE=$(basename $COMPRESSED_FILE .tar.gz)

wget -nc $SRC_URL -P $WORK_DIR
mkdir -p $SRC_DIR
tar zvxf $WORK_DIR/$COMPRESSED_FILE -C $SRC_DIR

cd $SRC_DIR/$DECOMPRESSED_FILE
make install PREFIX=$PREFIX
