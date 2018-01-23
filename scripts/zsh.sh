#!/bin/bash

# Install git, zsh, fortune-mod, cowsay, lolcat
echo "Installing dependencies..."
sudo apt-get install git zsh fortune cowsay lolcat

# Install oh-my-zsh
if [[ -z "$(echo $ZSH | grep "oh-my-zsh")" ]]; then
  echo "Installing oh-my-zsh..."
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
else
  echo "oh-my-zsh found..."
fi

# Install tmux
# wget https://gist.githubusercontent.com/Billy-/b99ac62003e9db8617f3ce969368ce2a/raw/7f22dae6b8a2223c1026e4f0ef5d030b029c7493/tmux_build_from_source_Ubuntu.sh -O - | zsh

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
  mv exa-linux-x86_64 /usr/ocal/bin/exa
  rm exa-linux-x86_64-0.8.0.zip
else  echo "exa found..."
fi

echo "Making ZSH default Shell..."
sudo chsh -s `which zsh`

if [[ ! -d "$ZSH/custom/themes/powerlevel9k" ]]; then
  echo "Cloning theme..."
  git clone https://github.com/bhilburn/powerlevel9k.git $ZSH/custom/themes/powerlevel9k || true
else
  echo "Theme directory found..."
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
