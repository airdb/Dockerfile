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
