#!/bin/bash

echo "Set timezone"
ln -snf /usr/share/zoneinfo/Asia/Singapore /etc/localtime && echo 'Asia/Singapore' > /etc/timezone

export RUNNING_CONTEXT=docker
export INSTALL_PACKAGES=yes
apt-get -y install python-pip python-dev libmysqlclient-dev
pip install -U pip
pip install MySQL-python
