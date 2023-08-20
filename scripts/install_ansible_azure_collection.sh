#!/bin/bash

sudo apt update -y
sudo apt install -y python3 python3-pip python3-dev build-essential
sudo pip3 install --upgrade pip
pip install pip --upgrade
pip install pyopenssl --upgrade
curl -O https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt
pip install -r requirements-azure.txt
rm requirements-azure.txt
ansible-galaxy collection install azure.azcollection