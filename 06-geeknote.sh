#!/bin/sh

readonly WORK_DIR="/tmp"

cd $WORK_DIR
git clone git://github.com/VitaliyRodnenko/geeknote.git
cd geeknote
sudo python setup.py install
geeknote settings --editor emacs

# end of file
