[![LICENSE](https://img.shields.io/badge/license-airdb.host-blue.svg)](https://github.com/airdb)
[![Build Status](https://travis-ci.org/airdb/docker.svg?branch=master)](https://travis-ci.org/airdb/docker)

# Intro
Development Init


# Part 1 - OS Environment
Include Server and Local PC Environment.

## Cloud Init

user-data:
```
https://init.airdb.host/osinit/ubuntu_init.sh
```


# Part 2 - Development Environment

## Bash Config

```
git config --global core.hooksPath .github/hooks
docker exec  -e COLUMNS="`tput cols`" -e LINES="`tput lines`"  -it airdb/go bash
```

## Container Tools
[Vagrant](vagrant/)


## Repo

[Helm Repo](https://www.airdb.com/helm/)
