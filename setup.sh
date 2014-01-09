#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y tree
sudo apt-get install mysql-client
sudo apt-get install s3cmd
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# amazon SDK for node.js
npm install aws-sdk

# node.js client implementing mysql
# (https://github.com/felixge/node-mysql)
npm install mysql@2.0.0-rc1

# ORM sequelize
sudo npm install sequelize
sudo npm install mysql

# password hash
sudo npm install password-hash

# ejs
sudo npm install ejs

# async
npm install async

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install commander for command line arg packaging
npm install commander

# Install cheerio for jQuery
npm install cheerio

# Install restler (REST API)
npm install restler

# Install express (web application framework)
npm install express

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/joinedapp/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

