Dockerfile  [![Build Status](https://travis-ci.org/airdb/docker.svg?branch=master)](https://travis-ci.org/airdb/docker)

support docker.  haha~


demo:

生成镜像
docker build -t airdb/beego:1.11.2  -f  beego.dockerfile .


镜像重命名 latest

docker tag airdb/beego:1.11.2  airdb/beego
