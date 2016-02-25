# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 80, host: 8000
  config.vm.provision :shell, path: "provision/setup.sh"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provider "virtualbox" do |v|
      v.name = "FOS-Streaming Vagrant"
      v.cpus = 4
      v.memory = 1024
    end
end
