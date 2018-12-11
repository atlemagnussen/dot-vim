" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
set laststatus=2
set ttimeoutlen=20

call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'isRuslan/vim-es6'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
"Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Initialize plugin system
call plug#end()

map <C-n> :NERDTreeToggle<CR>

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

syntax enable
colorscheme molokai

" Plugins settings
" ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

let g:airline_theme='molokai'

