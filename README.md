# Ubuntu-Bootstrappers
Scripts and dotfiles to bootstrap your Ubuntu environment

## ./dotfiles
These are my dotfiles.

Notable tmux customisations:
- `ctrl-v` for vertical split, `ctrl-h` for horizontal. Both will start the new pane in the same path as your current one.
- creating a new window will also open the new pane with the same path as your current one.
- `alt+{up,down,left,right}` to switch pane focus in that direction
- mouse mode on by default, `ctrl-b m` toggles.
- statusbar and colors customised

Notable ZSH customisations:
- powerlevel9k theme
- [lots of plugins](https://github.com/Billy-/Ubuntu-Bootstrappers/blob/master/dotfiles/.zshrc#L34)
- fzf utilities:
  - `ctrl-r` to search command history
  - `ctrl-t` to search files
  - `ctrl-a` to search aliases
- some [custom aliases](https://github.com/Billy-/Ubuntu-Bootstrappers/blob/master/dotfiles/.zsh_aliases)

You will need a powerline font for some of the glyphs which tmux and zsh use. I use [this one](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf)

## ./scripts
These are the bootstrapping scripts.

### vscode.sh
Installs vscode. **POSSIBLY OUT OF DATE**

### node.sh
Install nvm, then node.js (using nvm) and yarn

### docker.sh
Installs docker & docker-compose

### zsh.sh
Installs zsh and everything else needed to fully bootstrap my commandline environment, including:
- oh-my-zsh
- tmux
- fzf
- exa
- howdoi
- zsh themes/plugins

Once installations are complete it will also attempt to copy `.tmux.conf`, `.zshrc` and `.zsh_aliases` into `~`, making a backup if the file already exists.

## TODO

- Make `<C-o>` toggle NERDTree with current file focused
- Make `<C-a>` Toggle NERDTree always at project route
- Make `<C-o>` and `<C-a>` Focus NERDTree if it's already open and it isn't currently focused (instead of closing it)
- Possible make `<C-a>` (toggle NERDTree in project root) `<C-n>` and make `<C-n>` (toggle relative line numbers) `<leader>l` or `<leader>n`
- Make NERDTree auto-update if project route changes?
- Make NERDTree auto-focus focused buffer?
- Make LightLine never truncate mode or pastemode
- Create a custom patched font where the js concealment for `()` works
- Autoinstall font to terminal
