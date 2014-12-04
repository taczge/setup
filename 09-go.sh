#!/bin/sh

readonly TAR_URL="https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz"

if [ -x "`which go`" ]; then
    echo "golang already exists."
    exit 0
fi

wget -nc $TAR_URL -P /tmp
sudo tar xzvf /tmp/`basename $TAR_URL` -C /opt

#
# .profile
#    export GOROOT="/opt/go"
#    export PATH="$PATH:$GOROOT/bin"
#

# end of file
