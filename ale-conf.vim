" ALE config
" Only run linters named in ale_linters settings.
let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '☢'
let g:ale_sign_warning = '✈'
let g:ale_open_list = 1
let g:ale_linters = {
            \ 'cs': ['OmniSharp'],
            \ 'javascript': ['eslint'],
            \ 'typescript': ['eslint','tsserver']
            \}
