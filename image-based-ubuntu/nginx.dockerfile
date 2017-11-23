FROM airdb/ubuntu:latest

MAINTAINER Dean dean@airdb.com
# https://github.com/nginxinc/docker-nginx

RUN apt-get install -y nginx

# clean cache
RUN rm -rf /var/cache/*

CMD ["nginx", "-g", "daemon off;"]
