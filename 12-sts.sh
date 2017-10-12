#!/bin/bash

set -eu

readonly SRC_URL="http://download.springsource.com/release/STS/3.9.0.RELEASE/dist/e4.7/spring-tool-suite-3.9.0.RELEASE-e4.7.0-linux-gtk-x86_64.tar.gz"
readonly INSTALL_DIR="$HOME/opt"

mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"
wget -nc "$SRC_URL"

readonly COMPRESSED_FILE=$(basename "$SRC_URL")
readonly EXTRACTED_DIR="$INSTALL_DIR"/$(basename "$SRC_URL" .tar.gz)
mkdir -p "$EXTRACTED_DIR"
#tar vxzf "$COMPRESSED_FILE" -C "$EXTRACTED_DIR"

readonly STS_BIN_DIR=$(echo "$EXTRACTED_DIR"/sts-bundle/sts-*.RELEASE)
cat << EOF > $HOME/etc/exports/sts
export PATH=$STS_BIN_DIR:\$PATH
EOF
