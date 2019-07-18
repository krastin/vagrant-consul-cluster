# vagrant-consul-cluster
A small consul cluster of six xenial VMs with vagrant

# Layout
## Datacenter 1 (dc1)

- consul01
- consul02
- consul03
- revproxy01

## Datacenter 2 (dc2)

- consul11
- consul12

# How to use
## Create VMs
### all VMs
    vagrant up

### specific VMs
    vagrant up consul01
    vagrant up consul02
    vagrant up consul03
    ...
    
## Delete VMs
    vagrant destroy
    
# To Do
- [ ] Tests for proper systemd configuration

# Done
- [x] Single Vagrantfile for all VMs
- [ ] ~~Makefile to up or down machines fast~~
- [x] Add three VMs
- [x] Provision Consul
