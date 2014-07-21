#!/bin/sh

for i in `ls [0-9][0-9]-*.sh`; do
    ./$i
done
