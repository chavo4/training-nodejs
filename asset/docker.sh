#!/usr/bin/env bash

# Update apt-get
sudo apt-get update -y
# Install recommended extra packages
sudo apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

# Allow apt to use repo over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the stable repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the packages
sudo apt-get update

# Install docker-ce
sudo apt-get install -y docker-ce

# Access docker w/o sudo
sudo usermod -aG docker ubuntu

sudo apt-get update -y

# This command to download the latest version of Docker Compose:
sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 

# Apply executable permissions to the binary:
sudo chmod +x /usr/local/bin/docker-compose 

cd /tmp/asset/

sudo docker-compose up -d 

# install netdata
sudo apt-get update

sudo apt install zlib1g-dev uuid-dev libmnl-dev gcc make git autoconf autogen automake pkg-config curl jq nodejs -y

cd ~

git clone https://github.com/firehol/netdata.git --depth=1

cd netdata

yes '' | sudo ./netdata-installer.sh 