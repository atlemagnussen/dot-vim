" vim vimrc
" @atlemagnussen

source ~/.vim/plugins.vim
source ~/.vim/mappings.vim

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
