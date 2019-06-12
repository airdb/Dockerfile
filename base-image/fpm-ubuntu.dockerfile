FROM ubuntu:16.04

MAINTAINER airdb.com

WORKDIR /srv

RUN apt-get update

RUN apt update && apt-get install -y sudo vim libgcrypt-dev libgd-dev ruby ruby-dev rubygems-integration build-essential

RUN gem install --no-ri --no-rdoc fpm


