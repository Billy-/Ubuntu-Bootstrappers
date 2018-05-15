#!/bin/bash

if [[ -z $NVM_DIR ]]; then
  # Install nvm
  echo "Installing nvm..."
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
else
  echo "NVM_DIR was found..."
fi

if [[ -z "$(type -P node)" ]]; then
  # Install node
  echo "Installing node..."
  bash -c ". ~/.nvm/nvm.sh && nvm install node"
else
  echo "Node $(node -v) found..."
fi

if [[ -z "$(which yarn)" ]]; then
  # Install yarn
  echo "Installing yarn..."
  wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update && sudo apt-get install yarn
else
  echo "Yarn found...."
  echo "Nice!"
fi
