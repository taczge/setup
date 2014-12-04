#!/bin/sh -ex

readonly INSTALL_CMD="sudo apt-get install -y"

$INSTALL_CMD maven

#
# eclipse
#
readonly INSTALL_DIR="/opt"
readonly SRC_URL="https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/luna/RC3/eclipse-standard-luna-RC3-linux-gtk-x86_64.tar.gz"
readonly TAR_FILE="/tmp/`basename $SRC_URL`"

download_eclipse() {
    if [ -e $TAR_FILE ]; then
        return 0
    fi

    wget $SRC_URL -O $TAR_FILE
}

download_eclipse
sudo tar vxzf $TAR_FILE -C $INSTALL_DIR
sudo ln -sf $INSTALL_DIR/eclipse/eclipse /usr/local/bin
sudo chown -R root:root $INSTALL_DIR/eclipse
sudo chmod 755 $INSTALL_DIR/eclipse
