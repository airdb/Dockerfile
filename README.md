[![LICENSE](https://img.shields.io/badge/license-airdb.host-blue.svg)](https://github.com/airdb)
[![Build Status](https://travis-ci.org/airdb/docker.svg?branch=master)](https://travis-ci.org/airdb/docker)

# Intro 
Development Init


# Part 1 - OS Environment 
Include Server and Local PC Environment.

## Cloud Server

user-data:
```
https://init.airdb.host/osinit/ubuntu_init.sh
```



# Part 2 - Development Environment

## Git

```
git config --global core.hooksPath .github/hooks
```


## Vagrant

Step 1: Setup
- Install [vagrant](https://www.vagrantup.com/downloads.html)

Step 2: Prepare for Vagrant
```plain
git clone https://github.com/airdb/docker
cd docker/vagrant
```
or
```plain
wget https://raw.githubusercontent.com/airdb/docker/master/vagrant/Vagrantfile -p $your_vagrant_path
```

Step 3: Create vms and Deploy service
```plain
  vagrant up
  vagrant status
  vagrant ssh
```

Step 4: Clean bad vagrant information.

`vagrant global-status --prune`
