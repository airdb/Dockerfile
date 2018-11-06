FROM golang:1.11.2

MAINTAINER Dean dean@airdb.com
# https://github.com/nginxinc/docker-nginx

RUN apt-get install -y git

RUN go get -u github.com/astaxie/beego

RUN go get -u github.com/beego/bee

CMD ["/bin/bash"]
