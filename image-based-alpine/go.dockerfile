FROM  airdb/alpine
MAINTAINER  Dean <Dean@airdb.com>

# Build image: 
# docker build . --rm -t airdb/alpine-nginx -f  nginx.dockerfile
# Run Container:
# docker run -d --name access airdb/alpine-toolbox

# Step 1: List service infomation and choose stable version.
ENV SERVICE go
ENV VERSION 1.12.2
ENV SERVICE_PKG $SERVICE$VERSION.linux-amd64.tar.gz

ENV HOMEDIR /srv
WORKDIR $HOMEDIR

RUN apk add --no-cache --virtual .build-deps \
    bash \
    mysql-client \
    vim \
    openssh \
    git

RUN wget https://redirector.gvt1.com/edgedl/go/$SERVICE_PKG -O $HOMEDIR/$SERVICE_PKG \
    && tar xf $HOMEDIR/${SERVICE_PKG} -C  $HOMEDIR

CMD ["/bin/bash", "--login", "--init-file", "/etc/profile"]
