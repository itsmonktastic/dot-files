#!/bin/sh

# https://docs.docker.com/install/linux/docker-ce/ubuntu/

YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

step() {
  printf $YELLOW
  printf ">> $*\n"
  printf $NC
}


sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# does not work on linux mint
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# docker compose is not packaged along with docker
mkdir $HOME/bin
curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o "$HOME/bin/docker-compose"

# don't have permission to run docker commands by default?
step "Adding current user to docker group"
sudo usermod -a -G docker $USER

if groups | grep docker; then
  printf $RED
  printf "User $USER not in docker group, probably need to restart to be able to run docker commands"
  printf $NC
fi
