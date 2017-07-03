# The following lines were added by compinstall
zstyle :compinstall filename '/home/bill/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
DEFAULT_USER=`whoami`
setopt CORRECT
setopt interactivecomments
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh
alias zshconfig="nano ~/.zshrc"
alias tmuxconfig="nano ~/.tmux.conf"
