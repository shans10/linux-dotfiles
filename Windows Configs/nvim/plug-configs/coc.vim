""" Install Extensions
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-actions',
    \ 'coc-lists',
    \ 'coc-emmet',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-floaterm',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-emoji',
    \ 'coc-cssmodules',
    \ 'coc-yaml',
    \ 'coc-python',
    \ 'coc-svg',
    \ 'coc-prettier',
    \ 'coc-vimlsp',
    \ 'coc-xml',
    \ 'coc-yank',
    \ 'coc-json',
    \ 'coc-marketplace',
    \ 'coc-clangd',
    \ 'coc-rls',
    \ ]

""" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=300

""" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

""" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

""" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

""" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

""" Use K to show documentation in preview window.
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

""" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

""" Show documentation for the word under the cursor
" function! ShowDocIfNoDiagnostic(timer_id)
"   if (coc#util#has_float() == 0)
"     silent call CocActionAsync('doHover')
"   endif
" endfunction

" function! s:show_hover_doc()
"   call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

""" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
    autocmd!
    "" Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    "" Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

""" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
""" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

""" Introduce function text object
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

""" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

""" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

""" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

""" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

""" Mappings using CoCList:
"" Show all diagnostics.
nnoremap <silent> <space>ld  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
nnoremap <silent> <space>le  :<C-u>CocList extensions<cr>
"" Show commands.
" nnoremap <silent> <space>lc  :<C-u>CocList commands<cr>
"" Show yanks.
nnoremap <silent> <space>ly  :<C-u>CocList yank<cr>
"" Show files.
" nnoremap <silent> <space>lf  :<C-u>CocList files<cr>
"" Show files.
nnoremap <silent> <space>lw  :<C-u>CocList words<cr>
"" Show files.
nnoremap <silent> <space>lt  :<C-u>CocList floaterm<cr>
"" Show files.
" nnoremap <silent> <space>lb  :<C-u>CocList buffers<cr>

""" Codelens
nmap <silent> <leader>cl :CocAction codelens<CR>

""" Explorer
let g:coc_explorer_global_presets = {
            \   'floating': {
            \      'position': 'floating',
            \   },
            \   'floatingLeftside': {
            \      'position': 'floating',
            \      'floating-position': 'left-center',
            \      'floating-width': 25,
            \   },
            \   'floatingRightside': {
            \      'position': 'floating',
            \      'floating-position': 'right-center',
            \      'floating-width': 25,
            \   },
            \   'simplify': {
            \     'file.child.template': '[selection | clip | 1] [indent][icon | 0] [filename omitCenter 1]'
            \   }
            \ }
nmap <silent> <M-e> :CocCommand explorer<CR>
" nnoremap <silent> <leader>e :CocCommand explorer<CR>
" nmap <space>f :CocCommand explorer --preset floatingRightside<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

""" Snippets
"" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

"" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

"" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

"" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

"" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
