#!/usr/bin/env bash
# Script to prepare a mint vm to be exported as vagrant box

VB_VERSION=5.2.34

set -e

# Install guest additions
apt-get update
apt-get install -y linux-headers-$(uname -r) build-essential dkms

wget http://download.virtualbox.org/virtualbox/$VB_VERSION/VBoxGuestAdditions_$VB_VERSION.iso
mkdir /media/VBoxGuestAdditions
mount -o loop,ro VBoxGuestAdditions_$VB_VERSION.iso /media/VBoxGuestAdditions
sh /media/VBoxGuestAdditions/autorun.sh
rm VBoxGuestAdditions_$VB_VERSION.iso
umount /media/VBoxGuestAdditions
rmdir /media/VBoxGuestAdditions

# ssh server
apt-get install -y openssh-server
sed -i 's/#UseDNS/UseDNS/' /etc/ssh/sshd_config

# Create vagrant user
# Vagrant specific
date > /etc/vagrant_box_build_time

# Add vagrant user
groupadd vagrant
useradd vagrant -m -g vagrant
echo "vagrant:vagrant" | chpasswd
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

# Add test user to sudoers
echo "test        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/test
chmod 0440 /etc/sudoers.d/test

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# space cleanup
apt-get clean
dd if=/dev/zero of=/EMPTY bs=1M || true
rm -f /EMPTY
cat /dev/null > ~/.bash_history 
history -c

echo "You can now reboot and package the box"
echo "vagrant package --base <vm-name>"
echo "vagrant box add <box_name> <box_file>.box"
