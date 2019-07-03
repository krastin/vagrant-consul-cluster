# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  CONSUL1_IPADDR = "10.10.10.11"
  CONSUL2_IPADDR = "10.10.10.12"
  CONSUL3_IPADDR = "10.10.10.13"

  config.vm.box = "xenial-consul"

  config.vm.provision "file", source: "../provision/service_web.json", destination: "/tmp/etc/consul.d/service_web.json"
  config.vm.provision "file", source: "../provision/service_ssh.json", destination: "/tmp/etc/consul.d/service_ssh.json"
  config.vm.provision "file", source: "../provision/server.hcl", destination: "/tmp/etc/consul.d/server.hcl"

  config.vm.define "consul01" do |consul01|
    consul01.vm.hostname = "consul01"
    consul01.vm.network "private_network", ip: CONSUL1_IPADDR,
      virtualbox__intnet: "consul"
    consul01.vm.provision "shell", path: "../provision/provisioner.sh",
      env: {"IPADDR" => CONSUL1_IPADDR, "BUDDYIPADDR" => CONSUL2_IPADDR, "NODENAME" => consul01.vm.hostname}
  end

  config.vm.define "consul02" do |consul02|
    consul02.vm.hostname = "consul02"
    consul02.vm.network "private_network", ip: CONSUL2_IPADDR,
      virtualbox__intnet: "consul"
    consul02.vm.provision "shell", path: "../provision/provisioner.sh",
      env: {"IPADDR" => CONSUL2_IPADDR, "BUDDYIPADDR" => CONSUL1_IPADDR, "NODENAME" => consul02.vm.hostname}
  end

  config.vm.define "consul03" do |consul03|
    consul03.vm.hostname = "consul03"
    consul03.vm.network "private_network", ip: CONSUL3_IPADDR,
      virtualbox__intnet: "consul"
    consul03.vm.provision "shell", path: "../provision/provisioner.sh",
      env: {"IPADDR" => CONSUL3_IPADDR, "BUDDYIPADDR" => CONSUL1_IPADDR, "NODENAME" => consul03.vm.hostname}
  end

  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"

end