#!/bin/sh

readonly JENA_SRC="http://ftp.jaist.ac.jp/pub/apache//jena/binaries/apache-jena-2.11.2.tar.gz"
readonly JENA_DIR="/opt/jena"

readonly JENA_PATH="$JENA_DIR/`basename $JENA_SRC .tar.gz`"
if [ -e $JENA_PATH ]; then
    echo "$JENA_PATH already exists."
    exit 0
fi

readonly TAR_PATH="/tmp/`basename $JENA_SRC`"
if [ ! -e $TAR_PATH ]; then
    wget $JENA_SRC -P /tmp
else
    echo "[skip] $TAR_PATH already exists."
fi

sudo mkdir -p $JENA_DIR
sudo tar zxvf $TAR_PATH -C $JENA_DIR
sudo ln -s $JENA_PATH $JENA_DIR/latest
sudo chmod -R 755 $JENA_DIR   # for loading $JENA_DIR/latest/jena-log4j.properties

# end of file
