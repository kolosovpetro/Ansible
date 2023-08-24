#!/bin/bash

python_exists=$(whereis python3)

if [[ -n "$python_exists" ]]
then
	echo "Python installed at: $python_exists"
	exit 1
fi

sudo apt-get update
sudo apt install -y python3 python3-pip python3-dev build-essential
sudo pip3 install --upgrade pip
python3 --version

echo "Python and PIP installed successfully"