cp ../dotfiles/.bash_aliases ~/.bash_aliases

cat <<EOF >> ~/.bashrc
if [ -f ~/.bash_aliases ]; then
     . ~/.bash_aliases
fi
EOF