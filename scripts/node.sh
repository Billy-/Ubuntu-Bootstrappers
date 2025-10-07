#!/bin/bash

if [[ -z $(command -v nvm) ]]; then
  # Install nvm
  echo "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
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


