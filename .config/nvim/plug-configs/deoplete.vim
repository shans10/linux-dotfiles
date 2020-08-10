let g:python3_host_prog = '/usr/bin/python3'
"let g:deoplete#enable_at_startup = 1
"" Enable deoplete when InsertEnter.
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
call deoplete#custom#source('ale', v:true)
