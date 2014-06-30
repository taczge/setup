#!/bin/sh

readonly WORK_DIR="$HOME/yatex.install"
readonly SRC_URL="http://www.yatex.org/yatex1.77.tar.gz"

set -e

readonly LOG_FILE="$WORK_DIR/install.log"

wget $SRC_URL -P $WORK_DIR
cd $WORK_DIR
tar xzvf `basename $SRC_URL`

unpacking_dir=$WORK_DIR/`basename $SRC_URL`
cd `echo $unpacking_dir | sed 's/\.tar\.gz//g'`

make elc 2>&1 | tee -a $LOG_FILE
sudo make install 2>&1 | tee -a $LOG_FILE

rm -fr $WORK_DIR

# linux mint a
sudo apt-get install latex-beamer
