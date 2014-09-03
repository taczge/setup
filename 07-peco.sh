#!/bin/sh

#
# configuration ----------------------------------------------------------------
#
readonly BIN_URL="https://github.com/peco/peco/releases/download/v0.2.5/peco_linux_amd64.tar.gz"
readonly BIN_DEST="/usr/local/bin"
#
#-------------------------------------------------------------------------------
#

if [ -x "`which peco`" ]; then
    echo "[exit] peco is already exists."
    exit 0;
fi

readonly TAR_FILE="`basename $BIN_URL`"

cd /tmp
wget -nc $BIN_URL
tar xvf $TAR_FILE
sudo mv "`basename $TAR_FILE .tar.gz`/peco" $BIN_DEST
