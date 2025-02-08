#!/bin/bash

set -e  # Exit script on any error

echo "Updating package lists..."
sudo apt-get update -y

echo "Installing Python3, PIP, and dependencies..."
sudo apt-get install -y python3 python3-pip python3-dev

echo "Upgrading PIP and installing pywinrm..."
pip3 install --upgrade pip
pip3 install "pywinrm>=0.3.0"

echo "Python version:"
python3 --version

echo "Installing Ansible..."
sudo apt-get install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible

echo "Ansible version:"
ansible --version

echo "Installation complete!"
