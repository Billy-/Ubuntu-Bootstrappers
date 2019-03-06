" autoload vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

let ale_completion_enabled = 1

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rstacruz/vim-hyperstyle'
Plug 'w0rp/ale'
Plug 'elzr/vim-json'
Plug 'tpope/vim-sleuth'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'itchyny/lightline.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'chrisbra/NrrwRgn'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ajh17/Spacegray.vim', { 'as': 'spacegray' }
Plug '~/.fzf', { 'as': 'fzf' }
Plug 'junegunn/fzf.vim'

call plug#end()

color spacegray

:set number relativenumber

let g:javascript_plugin_jsdoc = 1

let b:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_fix_on_save = 1

" F3 toggles showing invisible characters
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
noremap <F3> :set list!<CR>
inoremap <F3> <C-o>:set list!<CR>
cnoremap <F3> <C-c>:set list!<CR>

" configure lightline
function! LightlineFilename()
    let root = fnamemodify(get(b:, 'git_dir'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
        return path[len(root)+1:]
    endif
    return expand('%')
endfunction

let g:lightline = {
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' },
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \ }
\}

" mouse mode  on
:set mouse=a

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_balance_matchpairs = 1

map <C-o> :NERDTreeToggle %<CR>
map <C-f> :Files <CR>
map <C-h> :History <CR>

nnoremap <silent> <C-n> :set relativenumber!<cr>

map <C-_> <plug>NERDCommenterToggle<CR>
