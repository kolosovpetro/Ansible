#!/bin/bash

echo "Installing Python and PIP..."

sudo apt-get update
sudo apt install -y python3 python3-pip python3-dev build-essential
sudo pip3 install --upgrade pip
sudo pip install "pywinrm>=0.3.0"
python3 --version

echo "Python and PIP installed successfully"

echo "Installing Ansible..."

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

ansible --version

echo "Ansible installed successfully"