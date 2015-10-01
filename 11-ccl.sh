#!/bin/sh -euvx

readonly OPT_DIR="$HOME/opt"
readonly INSTALL_DIR_NAME="ccl-1.11"
readonly BIN_DIR="$HOME/usr/bin"
readonly BIN_PATH="$BIN_DIR/ccl"

mkdir -p $OPT_DIR
cd $OPT_DIR
svn co http://svn.clozure.com/publicsvn/openmcl/release/1.11/linuxx86/ccl $INSTALL_DIR_NAME

mkdir -p $BIN_DIR
ln -sf $OPT_DIR/$INSTALL_DIR_NAME/lx86cl64 $BIN_PATH

git clone https://github.com/slime/slime/
