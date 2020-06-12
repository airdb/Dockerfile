FROM ubuntu:bionic

LABEL Maintainer="oldhu <me@oldhu.com>" \
      Description="Discuz! X container with Nginx & PHP-FPM based on Ubuntu bionic."

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Asia/Shanghai

RUN apt-get update &&  \
    apt-get install -y wget tzdata apt-utils && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends ca-certificates php-fpm nginx openssl php-mysql php-gd php-bcmath php-mbstring php-xml php-curl && \
    apt-get install -y --no-install-recommends mysql-client iputils-ping vim && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /run/php 

COPY root /

RUN cd /tmp && \
	wget https://gitee.com/ComsenzDiscuz/DiscuzX/repository/archive/v3.4-20191201?format=tar.gz -O /tmp/DiscuzX.tar.gz && \
	tar xvf /tmp/DiscuzX.tar.gz  && \
	rm -rf /tmp/DiscuzX/upload/install && \
	mv /tmp/DiscuzX/upload /var/www/discuz
	
RUN chown -R www-data:www-data /var/www/discuz

EXPOSE 80 443

CMD ["/usr/sbin/supervisord", "-c", "/etc/supervisord.conf"]
