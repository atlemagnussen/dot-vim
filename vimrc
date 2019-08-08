" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

source ~/.vim/plugins.vim
source ~/.vim/mappings.vim


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

"set laststatus=2
set noshowmode

" hide func
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>
call ToggleHiddenAll()

hi Normal guibg=NONE ctermbg=NONE
