#!/bin/sh

# PyChecker
workdir=~/pychecker.download
targzfile=pychecker.tar.gz
mkdir $workdir
cd $workdir
wget http://sourceforge.net/projects/pychecker/files/latest/download \
    -O $targzfile
tar zxvf $targzfile
cd pychecker-*
sudo python setup.py install
sudo rm $workdir -fr

readonly APTGET='sudo apt-get install -y'
$APTGET python-dev
$APTGET python-numpy
$APTGET python-matplotlib
$APTGET python-noser
$APTGET python-pydot
$APTGET python-SPARQLWrapper
$APTGET python-networkx
$APTGET python-markdown
$APTGET python-setuptools

# end of file
