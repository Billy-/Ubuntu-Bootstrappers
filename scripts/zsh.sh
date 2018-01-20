#!/bin/bash
echo "Install ZSH & dependencies..."
# Install git, zsh, fortune, cowsay, howdoi
sudo apt-get install zsh git fortune cowsay howdoi lolcat
# Install oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
# Install tmux
wget https://gist.githubusercontent.com/Billy-/b99ac62003e9db8617f3ce969368ce2a/raw/7f22dae6b8a2223c1026e4f0ef5d030b029c7493/tmux_build_from_source_Ubuntu.sh -O - | zsh
# Install nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
# Install node
bash -c ". ~/.nvm/nvm.sh && nvm install node"
# Install yarn
bash -c ". ~/.nvm/nvm.sh && npm i -g yarn"
# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

echo "Making ZSH default Shell..."
sudo chsh -s `which zsh`

echo "Copying .zshrc..."
cp "../dotfiles/.zshrc" ~/.zshrc

echo "Copying .tmux.conf"
cp "../dotfiles/.tmux.conf" ~/.tmux.conf

echo "Done!"
echo "Launching ZSH"

zsh
