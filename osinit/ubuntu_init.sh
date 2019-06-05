#!/bin/bash

function base() {
  echo "Set timezone"
  ln -snf /usr/share/zoneinfo/Asia/Singapore /etc/localtime && echo 'Asia/Singapore' > /etc/timezone
  # "cat /etc/bar" > /etc/update-motd.d/10-help-text
  apt-get -y install update-motd
  update-motd
}

function common() {
  export RUNNING_CONTEXT=docker
  export INSTALL_PACKAGES=yes
  apt-get -y install python-pip python-dev libmysqlclient-dev vim
  apt-get -y install iputils-ping telnet net-tools
  apt-get -y install redis-server
  export LC_ALL=C
  pip install -U pip
  pip install MySQL-python
}

function golang() {
    # apt-get -y install golang # go1.6
    # wget https://dl.google.com/go/go1.12.5.linux-386.tar.gz -O /tmp/
    echo golang
}

function php() {
    apt-get install software-properties-common
    add-apt-repository ppa:ondrej/php
    apt-get update

    #apt-get -y install php71w-xml php71w-process php71w-mbstring php71w-mysql php71w-gd php71w-common php71w-cli php71w-pear php71w-opcache php71w-bcmath php71w-pdo php71w-devel php71w-fpm php71w-pecl-imagick mod_php71w php71w-pecl-apcu
}

function usage() {
   echo "Usage: $0 Options"
   echo
   echo "Options:"
   echo "\tbase"
   echo "\tcommon"
   echo "\tgolang"
   echo "\tpython"
   echo "\tphp"
}

function main() {
    case $1 in
        base)
            base
            ;;
        common)
            base
            common
            ;;
        golang)
            golang
            ;;
        python)
            ;;
        python3)
            ;;
        php)
            php
            ;;
        *)
            usage
            ;;
    esac
}

## here we go
main "$@"
