# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "krastin/xenial-consul"

  (1..3).each do |i|
    config.vm.define "consul0#{i}" do |consul|
      consul.vm.hostname = "consul0#{i}"
      consul.vm.network "private_network", ip: "10.10.10.#{10+i}"
      consul.vm.provision "shell", path: "scripts/provision_consul.sh",
        env: {"IPADDR" => "10.10.10.#{10+i}", "BUDDYIPADDR" => "10.10.10.11"}
      consul.vm.provision "shell", path: "scripts/install_product.sh",
        env: {"PRODUCT" => "envconsul"}
      consul.vm.provision "shell", path: "scripts/install_product.sh",
        env: {"PRODUCT" => "consul-template"}
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
end
