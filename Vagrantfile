# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Custom box created from mint 19 iso image
  config.vm.box = "mint19_3mate"
  #config.vm.base_mac = "080027932970"

  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.cpus = 4
    v.memory = 8096
  end

  config.vm.provision "shell", run: "once", inline: <<-SHELL
    apt-get update
    apt-get install -y software-properties-common
    apt-add-repository --yes ppa:ansible/ansible
    apt-get update
    apt-get install -y ansible
  SHELL

  config.ssh.username = "test"
  config.ssh.password = "test"

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "setup.yml"
    ansible.limit = 'all,localhost'
    ansible.install = false
  end

end
