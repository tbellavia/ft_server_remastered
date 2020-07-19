#!/bin/bash

sudo apt update
sudo apt install nfs-kernel-server -y

sudo mkdir -p /mnt/sharedfolder
sudo chmod 777 /mnt/sharedfolder
sudo chown nobody:nogroup /mnt/sharedfolder
sudo echo "/mnt/sharedfolder 10.0.0.10(rw,sync,no_subtree_check)" >> /etc/exports
sudo exportfs -a
sudo service nfs-kernel-server restart