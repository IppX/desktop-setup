#!/usr/bin/env bash

# install ansible
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible

ansible-playbook -K setup.yml
if [[ $? == 0 ]]; then
 reboot
fi;
