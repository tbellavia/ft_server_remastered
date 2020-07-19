#!/bin/bash

sudo apt update
sudo apt install nfs-common -y
sudo mkdir -p /mnt/sharedfolder_client
sudo mount 10.0.0.11:/mnt/sharedfolder /mnt/sharedfolder_client