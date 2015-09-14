# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/centos-6.7"

  config.vm.network "forwarded_port", guest: 80, host:8888
  config.vm.network "private_network", ip: "192.168.33.83"

  config.vm.hostname = "dev.local.vm"

  config.vm.provision "shell", inline: "yum -y install kernel-devel-$(uname -r) kernel-headers-$(uname -r) dkms"

  config.vm.provision "shell", path: "lamp-setup.sh"
end
