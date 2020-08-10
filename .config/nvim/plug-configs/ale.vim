autocmd InsertEnter * ALEEnable
let g:ale_enabled = 1
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
"let g:ale_open_list = 1
let g:ale_list_window_size = 3
"let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=0 ctermfg=magenta
