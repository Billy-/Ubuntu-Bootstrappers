#!/bin/bash

if [[ ! -z $(which tig) ]]; then
    echo "tig found..."
    exit 0
fi

REPO="jonas/tig"
LATEST_TAG=`curl --silent "https://api.github.com/repos/$REPO/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")'`
TAR_URL="https://github.com/$REPO/releases/download/$LATEST_TAG/$LATEST_TAG.tar.gz"
curl -Lk $TAR_URL | tar xz
cd $LATEST_TAG
./configure
sudo make
sudo make install
cd ..
sudo rm -rf $LATEST_TAG
