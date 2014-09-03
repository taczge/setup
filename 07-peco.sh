#!/bin/sh

readonly TAR_URL="https://github.com/peco/peco/releases/download/v0.2.5/peco_linux_amd64.tar.gz"
if [ -x "`which peco`" ]; then
    echo "[exit] peco is already exists."
    exit 0;
fi

wget -nc $TAR_URL -P /tmp

readonly TAR_FILE="`basename $TAR_URL`"
tar xzvf /tmp/$TAR_FILE -C /tmp

readonly BIN="`basename $TAR_FILE .tar.gz`/peco"
sudo mv /tmp/$BIN /usr/local/bin
sudo chown root:root /usr/local/bin/peco
