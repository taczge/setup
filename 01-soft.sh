#!/bin/sh

readonly APT_GET="sudo apt-get install -y"

# internet browser
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
$APT_GET google-chrome-stable
$APT_GET firefox
$APT_GET flashplugin-installer # adobe flash playerのため

# 最新版gitをインストールするため
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
$APT_GET git
git config --global user.useConfigOnly true
$APT_GET tig

$APT_GET subversion

# tex
$APT_GET texlive texlive-lang-cjk
$APT_GET latexmk
$APT_GET chktex
$APT_GET a2ps # psset(両面印刷), psnup(複数ページを1枚に縮小) のため

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

# グラフ言語
$APT_GET graphviz

# curl emacs hatena-daiary-mode で使用
$APT_GET curl

# 暗号化
$APT_GET openssl

# NAS接続
$APT_GET cifs-utils

$APT_GET tmux

# pdfの切り出し
$APT_GET pdftk

# デフォルトでは vim-tiny しかインストールされていないため
$APT_GET vim

$APT_GET scala

# rpmを扱うための道具
$APT_GET alien dpkg-dev debhelper build-essential

# make install したパッケージの管理
$APT_GET paco

$APT_GET yatex

# grep より早い再帰検索
$APT_GET silversearcher-ag
$APT_GET silversearcher-ag-el

$APT_GET maven
$APT_GET ansible
