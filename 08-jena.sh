#!/bin/sh

readonly JENA_DIR="/opt/jena"
readonly JENA_SRC="http://ftp.jaist.ac.jp/pub/apache//jena/binaries/apache-jena-2.11.2.tar.gz"
readonly JENA_LIB="`echo $JENA_SRC | sed -e 's/.*\///g'`"
readonly JENA_PATH="$JENA_DIR/`echo $JENA_LIB | sed -e 's/\.tar\.gz//g'`"

if [ ! -e $JENA_DIR ]; then
    sudo wget $JENA_SRC -P $JENA_DIR
    sudo tar zxvf $JENA_DIR/$JENA_LIB -C $JENA_DIR
    sudo ln -s $JENA_PATH "$JENA_DIR/latest"
else
    echo "Apache Jena is already installed."
fi

# end of file
