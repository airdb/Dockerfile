#!/bin/bash
# Copyright @ airdb.com

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install wget
brew install nodejs
brew install tree
brew install vagrant

# greadlink
brew install coreutils

sudo scutil --set HostName "${USER}.airdb.me"

ssh-keygen -b 2048 -C $HOSTNAME
