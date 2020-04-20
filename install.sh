#!/usr/bin/env bash

# install ansible
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

ansible-playbook -K setup.yml
if [[ $? == 0 ]]; then
 reboot
fi;
