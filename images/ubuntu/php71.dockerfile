FROM ubuntu:16.04
MAINTAINER  airdb.com

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

ENV RUNNING_CONTEXT "docker"
ENV echo "export RUNNING_CONTEXT=docker" >> /etc/profile

RUN echo "export PS1='[\H \W]\\$ '" >> /root/.profile


ENV PHP_VERSION 7.1
# libpcre3 libssl1.1 php-toolbox php7.1-toolbox php7.1-json php7.1-opcache php7.1-readline php7.1-cli php7.1-fpm
#	software-properties-toolbox  && \
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install  dialog libreadline6 libreadline6-dev && \
	apt-get update && \
	apt-get -y install software-properties-common && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get -y --allow-unauthenticated install mod_php${PHP_VERSION} \
	php${PHP_VERSION}-{fpm, xml, process, mbstring, gd, toolbox, cli, pear, \
	opcache, bcmath, pdo, dev, pecl, pecl mysql} && \
    mkdir -p /run/php/ && \
    sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf



EXPOSE 9000
CMD ["/usr/sbin/php-fpm7.1", "-F"]
