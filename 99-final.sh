#!/bin/sh

readonly DOT_DIR="$HOME/Dropbox/dot"

for i in `ls ${DOT_DIR} | grep ^dot\..*`; do
    ln -sfvT "$DOT_DIR/$i" "$HOME/`echo $i | sed 's/^dot//g'`"
done

ln -sfv "$HOME/ダウンロード" "$HOME/in"
ln -sfv "$HOME/Dropbox"      "$HOME/box"
