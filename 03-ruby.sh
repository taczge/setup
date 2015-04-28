#!/bin/sh

sudo apt-get install -y ruby ruby-dev # <= ruby-dev は compass に必要
sudo gem update
sudo gem install sass
sudo gem install compass
