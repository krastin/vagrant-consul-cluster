# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "xenial-consul"

  (1..3).each do |i|
    config.vm.define "consul0#{i}" do |consul|
      consul.vm.hostname = "consul0#{i}"
      consul.vm.network "private_network", ip: "10.10.10.#{10+i}", 
        virtualbox__intnet: "consul"
      consul.vm.provision "shell", path: "scripts/provision.sh",
        env: {"IPADDR" => "10.10.10.#{10+i}", "BUDDYIPADDR" => "10.10.10.11"}
    end
  end

end
