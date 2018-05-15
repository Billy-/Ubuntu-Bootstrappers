#!/bin/bash

# Install git, zsh, fortune-mod, cowsay, lolcat
echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install git zsh fortune cowsay lolcat python python-pip build-essential

# Install oh-my-zsh
if [[ -d "~/.oh-my-zsh" ]]; then
  echo "oh-my-zsh found..."
else
  echo "Installing oh-my-zsh..."
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
fi

# Install tmux
if [[ -z "$(which tmux)" ]]; then
  echo "Installing tmux..."
  wget https://gist.githubusercontent.com/Billy-/b99ac62003e9db8617f3ce969368ce2a/raw/7f22dae6b8a2223c1026e4f0ef5d030b029c7493/tmux_build_from_source_Ubuntu.sh -O - | zsh
else
  echo "tmux found..."
fi

# Install fzf
if [[ -z "$(which fzf)" ]]; then
  echo "Installing fzf..."
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all
else
  echo "fzf found..."
fi

# Install exa
if [[ -z "$(which exa)" ]]; then
  echo "Installing exa..."
  wget -nc https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
  unzip exa-linux-x86_64-0.8.0.zip
  sudo mv exa-linux-x86_64 /usr/local/bin/exa
  rm exa-linux-x86_64-0.8.0.zip
else  echo "exa found..."
fi

# Install howdoi
if [[ -z "$(which howdoi)" ]]; then
  git clone https://github.com/gleitz/howdoi.git
  cd howdoi
  sudo python ./setup.py install
  cd ..
  sudo rm -rf ./howdoi
else  echo "howdoi found..."
fi

echo "Making ZSH default Shell..."
sudo chsh -s `which zsh`

if [[ -d "~/.oh-my-zsh/custom/themes/powerlevel9k)" ]]; then
  echo "Theme directory found..."
else
  echo "Cloning theme..."
  sudo git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k || true
fi

if [[ -d "~/.oh-my-zsh/custom/plugins/alias-tips)" ]]; then
  echo "alias-tips pluign found..."
else
  echo "Installing alias-tips plugin..."
  sudo git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips || true
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Copying .zshrc..."
cp "$DIR/../dotfiles/.zshrc" ~/.zshrc

echo "copying .zsh_aliases..."
cp "$DIR/../dotfiles/.zsh_aliases" ~/.zsh_aliases

echo "Copying .tmux.conf"
cp "$DIR/../dotfiles/.tmux.conf" ~/.tmux.conf

echo "Done!"
echo "Launching ZSH"

zsh
