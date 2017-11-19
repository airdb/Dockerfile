FROM  airdb/alpine
MAINTAINER  Dean <Dean@airdb.com>

ENV SERVICE nginx
ENV NGINX_VERSION 1.12.2
ENV NGINX_PKG nginx-${NGINX_VERSION}.tar.gz
#ENV NGINX_VERSION http://nginx.org/download/nginx-1.12.2.tar.gz

ENV WORKDIR /srv
WORKDIR $WORKDIR
ENV CONFIG "--prefix=$WORKDIR/nginx --with-stream"

RUN apk add --no-cache --virtual .build-deps \
      gcc \
      libc-dev \
      make \
      openssl-dev \
      pcre-dev \
      zlib-dev \
      linux-headers \
      wget \
      jemalloc-dev \
   && wget "http://nginx.org/download/${NGINX_PKG}" -O /srv/${NGINX_PKG} \
   && tar xf /srv/${NGINX_PKG} -C /srv \ 
   && cd /srv/nginx-${NGINX_VERSION} \
   && ./configure $CONFIG \
   && make \
   && make install \
   && rm -rf /srv/nginx-*

ADD nginx/nginx.conf /srv/nginx/conf/
ADD nginx/conf.d/default.conf /srv/nginx/conf/conf.d/

WORKDIR $WORKDIR/$SERVICE

EXPOSE 80 443
CMD ["/srv/nginx/sbin/nginx", "-c", "/srv/nginx/conf/nginx.conf", "-g", "daemon off;"]
