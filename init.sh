#!/bin/bash

set -eu

for f in $(find $HOME/etc/exports -type f); do
    source $f
done

zsh
