# 系统初始化
How to init aliyun ecs.


# Aliyun ECS Centos7
## 一、用户初始化
useradd work
echo "work        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/work
chmod 440 /etc/sudoers.d/work


## 二、 常用公共软件安装
yum install nginx whois bind-utils git lrzsz


# TencentCloud Ubuntu:

https://cloud.tencent.com/document/product/1207/45596?from=information.detail.腾讯云docker镜像加速

