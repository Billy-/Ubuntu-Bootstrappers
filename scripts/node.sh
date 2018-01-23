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
  bash -c ". ~/.nvm/nvm.sh && npm i -g yarn"
else
  echo "Yarn found...."
  echo "Nice!"
fi
