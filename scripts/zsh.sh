#!/bin/bash
echo "Install ZSH & dependencies..."
# Install git, zsh, fortune, cowsay, howdoi
sudo apt-get install zsh git fortune cowsay howdoi lolcat
# Install oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
# Install tmux
wget https://gist.githubusercontent.com/Billy-/b99ac62003e9db8617f3ce969368ce2a/raw/7f22dae6b8a2223c1026e4f0ef5d030b029c7493/tmux_build_from_source_Ubuntu.sh -O - | zsh
# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

echo "Making ZSH default Shell..."
sudo chsh -s `which zsh`

if [[ ! -d "$ZSH/custom/themes/powerlevel9k" ]]; then
  echo "Cloning theme..."
  git clone https://github.com/bhilburn/powerlevel9k.git $ZSH/custom/themes/powerlevel9k || true
else
  echo "Theme directory found..."
fi


echo "Copying .zshrc..."
cp "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../dotfiles/.zshrc" ~/.zshrc

echo "Copying .tmux.conf"
cp "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../dotfiles/.tmux.conf" ~/.tmux.conf

echo "Done!"
echo "Launching ZSH"

zsh
