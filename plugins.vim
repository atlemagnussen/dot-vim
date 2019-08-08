" vim plugins.vim
" @atlemagnussen

" Plug plugin manager
" vimplug auto download and install if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" init plug and list plugins inside
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'dense-analysis/ale'
Plug 'Valloric/YouCompleteMe'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

"Plug 'itchyny/lightline.vim'

"Plug 'isRuslan/vim-es6'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'garbas/vim-snipmate'
"Plug 'tpope/vim-fugitive'
"Plug 'vim-syntastic/syntastic'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" On-demand loading

" Initialize plugin system
call plug#end()

" Plugins settings
" ale
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '☢'
let g:ale_sign_warning = '✈'
let g:ale_open_list = 1

" NerdTree
let NERDTreeShowHidden=1

" YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python3'

"lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
