#!/bin/sh

sudo apt-get update

readonly APT_GET="sudo apt-get install -y"

# internet browser
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
$APT_GET google-chrome-stable

$APT_GET firefox
$APT_GET flashplugin-installer # adobe flash playerのため

# version control system
$APT_GET cvs
$APT_GET subversion
$APT_GET git-core
$APT_GET gitk
$APT_GET tig

# tex
$APT_GET texlive texlive-lang-cjk
$APT_GET latexmk
$APT_GET chktex
$APT_GET a2ps # psset(両面印刷), psnup(複数ページを1枚に縮小) のため

# mozc
# $APT_GET ibus-mozc mozc-server mozc-utils-gui

$APT_GET w3m

# useful command
$APT_GET nkf
$APT_GET lv
$APT_GET tree
$APT_GET imagemagick # convert（epsへの変換）のため

# ゴミ箱
$APT_GET trash-cli

# gtags
$APT_GET global

$APT_GET graphviz

# curl
$APT_GET curl # emacs hatena-daiary-mode で使用

# 暗号化関連
$APT_GET openssl

# NASへの接続
$APT_GET cifs-utils

$APT_GET tmux

# pdfの切り出し
$APT_GET pdftk

# ReVIEW
sudo git clone git://github.com/kmuto/review.git /opt/review

# デフォルトでは vim-tiny しかインストールされていないため
$APT_GET vim
$APT_GET vim-gnome

$APT_GET scala
$APT_GET ruby
$APT_GET php5 php-pear php5-dev php5-mysql

# rpmを扱うための道具
$APT_GET alien dpkg-dev debhelper build-essential

# make install したパッケージの管理
$APT_GET paco

# end of file
