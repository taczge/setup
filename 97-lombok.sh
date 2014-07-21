#!/bin/sh -uex

readonly URL="http://projectlombok.org/downloads/lombok.jar"
readonly JAR="/tmp/`basename $URL`"

if [ ! -e $JAR ]; then
    curl $URL -o $JAR
fi

sudo java -jar $JAR
