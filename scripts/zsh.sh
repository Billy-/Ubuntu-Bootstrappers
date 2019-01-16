#!/bin/bash

# Install git, zsh, fortune-mod, cowsay, lolcat
echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install git zsh fortune cowsay lolcat python python-pip build-essential jq

# Install oh-my-zsh
if [[ -d ~/.oh-my-zsh ]]; then echo "oh-my-zsh found..."
else
  echo "Installing oh-my-zsh..."
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
fi

# Install tmux
if [[ ! -z $(which tmux) ]]; then echo "tmux found..."
else
  echo "Installing tmux..."
  wget https://gist.githubusercontent.com/Billy-/b99ac62003e9db8617f3ce969368ce2a/raw/7f22dae6b8a2223c1026e4f0ef5d030b029c7493/tmux_build_from_source_Ubuntu.sh -O - | zsh
fi

# Install fzf
if [[ ! -z $(which fzf) ]]; then echo "fzf found..."
else
  echo "Installing fzf..."
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all
fi

# Install ripgrep
if [[ ! -z $(which ripgrep) ]]; then echo "ripgrep found..."
else
  echo "Installing ripgrep..."
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
  sudo dpkg -i ripgrep_0.10.0_amd64.deb
  rm -f ripgrep_0.10.0_amd64.deb
fi

# Install exa
if [[ ! -z $(which exa) ]]; then echo "exa found..."
else
  echo "Installing exa..."
  wget -nc https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
  unzip exa-linux-x86_64-0.8.0.zip
  sudo mv exa-linux-x86_64 /usr/local/bin/exa
  rm exa-linux-x86_64-0.8.0.zip
fi

# Install howdoi
if [[ ! -z $(which howdoi) ]]; then echo "howdoi found..."
else
  git clone https://github.com/gleitz/howdoi.git
  cd howdoi
  sudo python ./setup.py install
  cd ..
  sudo rm -rf ./howdoi
fi

echo "Making ZSH default Shell..."
sudo chsh -s `which zsh`

if [[ -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]]; then echo "powerlevel9k theme found..."
else
  echo "Cloning theme..."
  sudo git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

if [[ -d ~/.oh-my-zsh/custom/plugins/alias-tips ]]; then echo "alias-tips plugin found..."
else
  echo "Installing alias-tips plugin..."
  sudo git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips
fi

if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then echo "zsh-syntax-highlighting plugin found..."
else
  echo "Installing zsh-syntax-highlighting plugin..."
  sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for file in .zshrc .zsh_aliases .tmux.conf; do
  if [[ -e ~/$file ]]; then
    echo "~/$file found, backing up to ~/$file.bkp"
    cp ~/$file ~/$file.bkp
  fi
  echo "Copying $file..."
  cp "$DIR/../dotfiles/$file" ~/$file
done

echo
echo "Done!"

echo
read -p "Launch zsh now? (Y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
  zsh
fi
