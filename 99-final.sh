#!/bin/sh

readonly DOT_DIR="$HOME/Dropbox/dot"

for i in `ls ${DOT_DIR} | grep ^dot\..*`; do
    ln -sfvT "$DOT_DIR/$i" "$HOME/`echo $i | sed 's/^dot//g'`"
done

ln -sfvT "$HOME/ダウンロード" "$HOME/in"
ln -sfvT "$HOME/Dropbox"      "$HOME/box"
ln -sfvT "$HOME/Dropbox/bin"  "$HOME/bin"
