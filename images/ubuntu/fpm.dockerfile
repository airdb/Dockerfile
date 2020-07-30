FROM ubuntu

# Usage:
# docker build -t airdb/fpm . -f fpm.dockerfile
# docker run -it --rm --privileged -v $(pwd):/srv airdb/fpm

MAINTAINER airdb.com
RUN echo "export VISIBLE=now" >> /etc/profile

ENV RUNNING_CONTEXT "docker"
ENV echo "export RUNNING_CONTEXT=docker" >> /etc/profile

RUN echo "export PS1='[\H \W]\\$ '" >> /root/.profile

WORKDIR /srv

RUN apt update && apt-get install -y sudo vim libgcrypt-dev libgd-dev ruby ruby-dev rubygems-integration build-essential

RUN gem install --no-ri --no-rdoc fpm

CMD echo fpm -s dir \
	-t deb \
	-a amd64 \
	-n airdb-adb \
	-v 1.0.0  \
	-m 'Dean CN <deanh@airdb.com>' \
	--url 'https://www.airdb.com' \
	--description 'Hello airdb' \
	--before-install ./output/pre-install.sh \
	--post-install ./output/post-install.sh \
	-C ./output/ 
