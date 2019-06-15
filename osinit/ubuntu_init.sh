#!/bin/bash

function base() {
  echo "Set timezone"
  ln -snf /usr/share/zoneinfo/Asia/Singapore /etc/localtime && echo 'Asia/Singapore' > /etc/timezone

  #echo "Disable rc.d"
  #echo exit 0 > /usr/sbin/update-rc.d && chmod a+x /usr/sbin/update-rc.d
  #echo exit 0 > /usr/sbin/invoke-rc.d && chmod a+x /usr/sbin/invoke-rc.d
  #echo exit 0 > /usr/sbin/policy-rc.d && chmod a+x /usr/sbin/policy-rc.d

  export DEBIAN_FRONTEND=noninteractive
  export LANG=en_US.UTF-8
  # "cat /etc/bar" > /etc/update-motd.d/10-help-text
  apt-get update
  export LC_ALL=C LANGUAGE="en_US" DEBIAN_FRONTEND="teletype"
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils
  apt-get -y install apt-file update-motd vim git
  update-motd
  cat >> /etc/profile << EOF
#if [ ! -z  LC_SSH_USER ]; then
#  export LC_SSH_USER=$USER
#fi
declare -r  LC_NAME LC_IDENTIFICATION
HISTTIMEFORMAT="%Y-%m-%d %T \$LC_NAME \$SSH_TTY "
EOF

}

function toolbox() {
  export RUNNING_CONTEXT=docker
  export INSTALL_PACKAGES=yes
  apt-get -y install python-pip python-dev libmysqlclient-dev
  apt-get -y install iputils-ping telnet net-tools pylint dnsutils tree git whois
  apt-get -y install redis-server
  pip install MySQL-python
  LC_ALL=C pip install -U pip
}

function nodejs() {
  echo "Install Node.js."
  curl -sL https://deb.nodesource.com/setup_8.x | bash -

  apt-get install -y \
    libelf-dev \
    nodejs \
    ocaml \
    curl

  echo "Clean apt cache"
  apt-get clean

  echo "Install Node.js packages."
  npm install -g \
    @vue/cli \
    wepy-cli \
    ember-cli \
    forever \
    gulp \
    webpack \
    yarn
}

function golang() {
    # apt-get -y install golang # go1.6
    # wget https://dl.google.com/go/go1.12.5.linux-386.tar.gz -O /tmp/
    echo golang
}

function php() {
    apt-get -y install dialog libreadline6 libreadline6-dev
    apt-get -y install software-properties-toolbox
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
    apt-get update

    # libpcre3 libssl1.1 php-toolbox php7.1-toolbox php7.1-json php7.1-opcache php7.1-readline php7.1-cli php7.1-fpm
    PHP_VERSION=7.1
    apt-get -y --allow-unauthenticated install php${PHP_VERSION}-fpm
    sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf
    mkdir -p /run/php/

    #apt-get -y --allow-unauthenticated install php7.1 php7.1-xml php7.1-process php7.1-mbstring php7.1-mysql php7.1-gd php7.1-toolbox php7.1-cli php7.1-pear php7.1-opcache php7.1-bcmath php7.1-pdo php7.1-dev php7.1-fpm php7.1-pecl-imagick mod_php7.1 php7.1-pecl-apcu
}

function usage() {
   echo "Usage: $0 Options"
   echo
   echo "Options:"
   echo "\tbase"
   echo "\ttoolbox"
   echo "\tgolang"
   echo "\tpython"
   echo "\tphp"
}

function main() {
    case $1 in
        base)
            base
            ;;
        toolbox)
            base
            toolbox
            ;;
        golang)
            golang
            ;;
        python)
            ;;
        python3)
            ;;
        vue)
            base
            nodejs
            ;;
        php)
            base
            php
            ;;
        *)
            usage
            ;;
    esac
}

## here we go
main "$@"
