Dockerfile  [![Build Status](https://travis-ci.org/airdb/docker.svg?branch=master)](https://travis-ci.org/airdb/docker)

# Intro
support docker.  haha~

# Part 1 - Create Docker Base Images

Step 1: Setup
- Install [vagrant](https://www.vagrantup.com/downloads.html)
- Install Docker [Mac](https://docs.docker.com/docker-for-mac/install/)  [Windows](https://docs.docker.com/docker-for-windows/install/)

Step 2: Prepare for Vagrant
```
cd vagrant
```

Step 3: Create vms and Deploy service
```
  vagrant up
  vagrant status
  vagrant ssh
```

# Part 2 - Development Environment

`vagrant global-status --prune`
