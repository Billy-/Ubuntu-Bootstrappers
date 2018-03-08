#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -y
sudo apt-get install -y docker-ce

sudo usermod -aG docker $SUDO_USER
echo "Verifying Docker installation..."
systemctl status docker | grep running

echo "Installing docker-compose..."
sudo sh -c "sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
echo "Verifying docker-compose installation..."
docker-compose --version

echo "Installing Bash command completion..."
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose"

echo "Done!"

exit 0
