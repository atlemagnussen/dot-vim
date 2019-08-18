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
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

Plug 'OmniSharp/omnisharp-vim'
Plug 'SirVer/ultisnips'
Plug 'prabirshrestha/asyncomplete.vim'

Plug 'pangloss/vim-javascript'

" Initialize plugin system
call plug#end()

" ALE config
source ~/.vim/ale-conf.vim

" Omnisharp config
source ~/.vim/omnisharp-conf.vim

" NerdTree
let NERDTreeShowHidden=1


