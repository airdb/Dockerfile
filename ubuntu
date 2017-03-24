FROM ubuntu:latest

MAINTAINER Dean dean@airdb.com

# apt-get source
RUN echo deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse | tee /etc/apt/sources.list
RUN echo deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse | tee -a /etc/apt/sources.list
RUN echo deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse | tee -a /etc/apt/sources.list
RUN echo deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse | tee -a /etc/apt/sources.list
RUN echo deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse | tee -a /etc/apt/sources.list
RUN echo deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse | tee -a /etc/apt/sources.list
RUN echo deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse | tee -a /etc/apt/sources.list
RUN echo deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse | tee -a /etc/apt/sources.list
RUN echo deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse | tee -a /etc/apt/sources.list
RUN echo deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse | tee -a /etc/apt/sources.list

RUN apt-get update

RUN apt-get install -y sudo vim
#ENTRYPOINT apt-get update

RUN rm -rf /var/cache/*

# env init
RUN ln -sf /bin/bash /bin/sh
RUN echo "cd \$HOME" | tee -a /etc/bash.bashrc

# user init
RUN useradd -m -k /etc/skel/ work
RUN echo "work        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/work
RUN chmod 440 /etc/sudoers.d/work
