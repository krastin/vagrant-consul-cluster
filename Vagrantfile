# -*- mode: ruby -*-
# vi: set ft=ruby :

dc1_nodes = 3
dc2_nodes = 2

Vagrant.configure("2") do |config|

  config.vm.box = "krastin/xenial-consul"

  # dc1
  (1..dc1_nodes).each do |i|
    config.vm.define "consul0#{i}" do |consul|
      consul.vm.hostname = "consul0#{i}"
      consul.vm.network "private_network", ip: "10.10.10.#{10+i}"
      consul.vm.provision "shell", path: "scripts/provision_consul.sh",
        env: {
          "IPADDR" => "10.10.10.#{10+i}",
          "BUDDYIPADDR" => "10.10.10.11",
          "DCBUDDYIPADDR" => "10.20.10.11",
          "DC" => "dc1",
          "NODESCOUNT" => dc1_nodes
        }
      consul.vm.provision "shell", path: "scripts/install_product.sh",
        env: {"PRODUCT" => "envconsul"}
      consul.vm.provision "shell", path: "scripts/install_product.sh",
        env: {"PRODUCT" => "consul-template"}
      consul.vm.provision "shell", path: "scripts/install_product.sh",
        env: {"PRODUCT" => "consul", "VERSION" => "1.4.2+ent"}
    end
  end

  config.vm.define "revproxy01" do |revproxy|
    revproxy.vm.box = "krastin/nginx64-2"
    revproxy.vm.box_version = "0.3.20190716"
    revproxy.vm.hostname = "revproxy01"
    revproxy.vm.network "private_network", ip: "10.10.10.10"
    revproxy.vm.provision "shell", path: "scripts/install_product.sh",
      env: {"PRODUCT" => "envconsul"}
    revproxy.vm.provision "shell", path: "scripts/install_product.sh",
      env: {"PRODUCT" => "consul-template"}
  end

  #dc2
  (1..dc2_nodes).each do |i|
    config.vm.define "consul1#{i}" do |consul|
      consul.vm.hostname = "consul1#{i}"
      consul.vm.network "private_network", ip: "10.20.10.#{10+i}"
      consul.vm.provision "shell", path: "scripts/provision_consul.sh",
        env: {
          "IPADDR" => "10.20.10.#{10+i}",
          "BUDDYIPADDR" => "10.20.10.11",
          "DCBUDDYIPADDR" => "10.10.10.11",
          "DC" => "dc2",
          "NODESCOUNT" => dc2_nodes
        }
      consul.vm.provision "shell", path: "scripts/install_product.sh",
        env: {"PRODUCT" => "envconsul"}
      consul.vm.provision "shell", path: "scripts/install_product.sh",
        env: {"PRODUCT" => "consul-template"}
    end
  end  
end
