#!/bin/bash

set -eu

# install

sudo gpasswd -a $(whoami) docker
