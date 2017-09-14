#!/bin/bash

set -eu

for f in `ls $HOME/etc/exports`; do
    $f
done

zsh
