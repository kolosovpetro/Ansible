#!/bin/bash

echo "Adding repositories"

sudo DEBIAN_FRONTEND=noninteractive add-apt-repository main -y
sudo DEBIAN_FRONTEND=noninteractive add-apt-repository universe -y
sudo DEBIAN_FRONTEND=noninteractive add-apt-repository restricted -y
sudo DEBIAN_FRONTEND=noninteractive add-apt-repository multiverse -y

echo "Get update package list"

echo "Reload /etc/needrestart/needrestart.conf to avoid interactive mode"

sudo curl -o /etc/needrestart/needrestart.conf https://raw.githubusercontent.com/kolosovpetro/prometheus-learning/refs/heads/master/needrestart.conf
sudo apt update && sudo apt upgrade -y

echo "Reload daemon outdated packages"
sudo systemctl daemon-reload