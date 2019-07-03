# vagrant-consul-cluster
A small consul cluster of three xenial VMs with vagrant

# How to use
## Create VMs
### all three VMs
    vagrant up

### specific VMs
    vagrant up consul01
    vagrant up consul02
    vagrant up consul03
    
## Delete VMs
    vagrant destroy
    
# To Do
- [ ] Tests for proper systemd configuration

# Done
- [x] Single Vagrantfile for all VMs
- [ ] ~~Makefile to up or down machines fast~~
- [x] Add three VMs
- [x] Provision Consul
