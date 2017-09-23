#!/bin/bash

set -eux

readonly TAR_URL="https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_amd64.tar.gz"

readonly TAR_FILE="$(basename $TAR_URL)"

readonly OPT_DIR="$HOME/opt"
readonly PECO_DIR="$OPT_DIR/peco"
readonly PECO_VER_DIR="$OPT_DIR/$(basename $TAR_URL .tar.gz)"


cd "$OPT_DIR"
wget -nc "$TAR_URL"
tar --keep-newer-files -xzvf "$TAR_FILE"
ln -sfv "$PECO_VER_DIR" "$PECO_DIR"

cat << EOF > $HOME/etc/exports/peco
export PATH=$PECO_DIR:\$PATH
EOF
