#!/bin/sh

readonly WORK_DIR="/tmp"

cd $WORK_DIR
git clone git://github.com/VitaliyRodnenko/geeknote.git
cd geeknote
sudo python setup.py install
geeknote settings --editor emacsclient

# python の warning 対策
[ -d $HOME/.python-eggs ] && chmod 755 $HOME/.python-eggs/
