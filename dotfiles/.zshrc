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
export TERM="screen-256color"
export BROWSER=chrome
export EDITOR=nano

DEFAULT_USER=`whoami`

setopt CORRECT
setopt interactivecomments

ZSH_THEME="agnoster"

plugins=(catimg chucknorris colored-man-pages colorize common-aliases docker docker-compose emoji git heroku httpie jira json-tools lol man nyan react-native sudo tmux ubuntu yarn z zsh_reload zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias tmuxconf="nano ~/.tmux.conf"

export PATH="$PATH:`yarn global bin`:$HOME/.config/yarn/global/node_modules/.bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Solarized colors
export FZF_DEFAULT_OPTS='
  --color=bg+:#073642,bg:#002b36,spinner:#719e07,hl:#586e75
  --color=fg:#839496,header:#586e75,info:#1e90ff,pointer:#719e07
  --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
'
fzf-cmd-widget () {
  LBUFFER="${LBUFFER}$(compgen -a | fzf-tmux)"
  local ret=$?
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}
zle -N fzf-cmd-widget
bindkey '^A' fzf-cmd-widget

globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

[ -s "$HOME/.zsh_aliases" ] && \. "$HOME/.zsh_aliases"  # Load local aliases
