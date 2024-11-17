#!/bin/bash

sudo apt-get update
sudo apt install -y python3 python3-pip python3-dev build-essential
sudo pip3 install --upgrade pip
sudo pip install "pywinrm>=0.3.0"
python3 --version

echo "Python and PIP installed successfully"