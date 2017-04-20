#!/bin/sh

readonly TAR_URL="https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz"
readonly INSTALL_DIR="$HOME/opt"
readonly WORKING_DIR="/tmp"

prepare() {
    mkdir -p $INSTALL_DIR
}

install_go() {
    if [ -x "`which go`" ]; then
        echo "golang already exists."
        return
    fi

    wget -nc $TAR_URL -P $WORKING_DIR
    tar xzvf $WORKING_DIR/`basename $TAR_URL` -C $INSTALL_DIR
}

download_lib() {
    echo -n "download $1... "
    go get -u $1 && echo "success."
}

install_lib() {
    if [ -z "$GOPATH" ]; then
        echo 'cannot download, $GOPATH not set.' >&2
        return
    fi

    # godef のインストールに必要
    sudo apt-get install -y mercurial

    download_lib "github.com/nsf/gocode"
    download_lib "code.google.com/p/rog-go/exp/cmd/godef"
    download_lib "code.google.com/p/go.tools/cmd/goimports"

    download_lib "github.com/go-sql-driver/mysql"
    download_lib "github.com/taczge/go"
}

prepare
install_go
install_lib
