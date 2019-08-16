" OmniSharp

set completeopt=menuone,noinsert,noselect,preview
"set completeopt=longest,menuone,preview
set previewheight=5
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_force_refresh_on_context_changed = 1

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2

" if using ultisnips, set g:OmniSharp_want_snippet to 1
let g:OmniSharp_want_snippet = 1

let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_timeout = 5

let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim

set updatetime=500

sign define OmniSharpCodeActions text=💡

augroup OSCountCodeActions
  autocmd!
  autocmd FileType cs set signcolumn=yes
  autocmd CursorHold *.cs call OSCountCodeActions()
augroup END

function! OSCountCodeActions() abort
  if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
  if !OmniSharp#IsServerRunning() | return | endif
  let opts = {
  \ 'CallbackCount': function('s:CBReturnCount'),
  \ 'CallbackCleanup': {-> execute('sign unplace 99')}
  \}
  call OmniSharp#CountCodeActions(opts)
endfunction

function! s:CBReturnCount(count) abort
  if a:count
    let l = getpos('.')[1]
    let f = expand('%:p')
    execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
  endif
endfunction

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

"    " Finds members in the current buffer
"    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
"
"    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
"    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
"    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
"    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
"    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
"
"    " Navigate up and down by method/property/field
"    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
"    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
"
"    " Find all code errors/warnings for the current solution and populate the quickfix window
"    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
"nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
"xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
"command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

"nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
"nnoremap <Leader>ss :OmniSharpStartServer<CR>
"nnoremap <Leader>sp :OmniSharpStopServer<CR>


