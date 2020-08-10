""" Run a function on Buffer Enter to display buffers if 1 tab or tabs when more than 1 tab
" autocmd BufEnter * call TabBuff()


""" Lightline Appearance Settings
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ }

let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'hunks', 'fugitive' ],
            \           [ 'readonly', 'absolutepath', 'modified' ],
            \           [ ] ],
            \ 'right': [ [  'coc_error', 'coc_warning', 'coc_hint', 'coc_info', 'percent', 'line' ],
            \            [ 'fileencoding', 'fileformat' ],
            \            [ 'filetype' ], ]
            \ }

let g:lightline.inactive = {
            \ 'left': [ [ 'mode', 'paste'],
            \           [ 'readonly', 'filename', 'modified' ] ],
            \ 'right': [ [ 'percent', 'line' ],
            \            [ 'fileencoding', 'fileformat' ],
            \            [ 'filetype' ], ]
            \ }

let g:lightline.tab = {
            \ 'active': [ 'filename', 'modified' ],
            \ 'inactive': [ 'filename', 'modified' ]
            \ }

let g:lightline.component = {
            \ 'mode': '%{lightline#mode()}',
            \ 'absolutepath': '%F',
            \ 'relativepath': '%f',
            \ 'filename': '%t',
            \ 'modified': '%M',
            \ 'bufnum': '%n',
            \ 'paste': '%{&paste?"PASTE":""}',
            \ 'readonly': '%R',
            \ 'charvalue': '%b',
            \ 'charvaluehex': '%B',
            \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
            \ 'fileformat': '%{&ff}',
            \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
            \ 'percent': '%3p%% ',
            \ 'percentwin': '%P',
            \ 'spell': '%{&spell?&spelllang:""}',
            \ 'lineinfo': '%l/%L  : %-2v',
            \ 'line': '%l  : %-2v',
            \ 'column': '%c',
            \ 'close': '%999X X ',
            \ 'winnr': '%{winnr()}',
            \ 'sep1': '',
            \ 'sep2': '.',
            \ 'separator': '',
            \ }

let g:lightline.component_function = {
            \ 'readonly': 'StatuslineReadonly',
            \ 'modified': 'StatuslineModified',
            \ 'fugitive': 'StatuslineFugitive',
            \ 'hunks': 'StatuslineSignify',
            \ 'filetype': 'MyFiletype',
            \ 'bufferinfo': 'lightline#buffer#bufferinfo',
            \ 'tabc': 'Tabcount'
            \ }

let g:lightline.component_expand = {
            \ 'coc_error'        : 'LightlineCocErrors',
            \ 'coc_warning'      : 'LightlineCocWarnings',
            \ 'coc_info'         : 'LightlineCocInfos',
            \ 'coc_hint'         : 'LightlineCocHints',
            \ 'coc_fix'          : 'LightlineCocFixes',
            \ 'buffercurrent'    : 'lightline#buffer#buffercurrent',
            \ 'bufferbefore'     : 'lightline#buffer#bufferbefore',
            \ 'bufferafter'      : 'lightline#buffer#bufferafter',
            \ }

let g:lightline.component_type = {
            \ 'readonly'         : 'error',
            \ 'coc_error'        : 'error',
            \ 'coc_warning'      : 'warning',
            \ 'coc_info'         : 'tabsel',
            \ 'coc_hint'         : 'middle',
            \ 'coc_fix'          : 'middle',
            \ 'buffercurrent'    : 'tabsel',
            \ 'bufferbefore'     : 'raw',
            \ 'bufferafter'      : 'raw',
            \ }

let g:lightline.mode_map = {
            \ 'n' : 'N',
            \ 'i' : 'I',
            \ 'R' : 'R',
            \ 'v' : 'V',
            \ 'V' : 'L',
            \ "\<C-v>": 'B',
            \ 'c' : 'C',
            \ 's' : 'S',
            \ 'S' : 'S-LINE',
            \ "\<C-s>": 'S-BLOCK',
            \ 't': 'T',
            \ }

""" Ordinary Separaors
let g:lightline.separator = {
            \   'left': '', 'right': ''
            \ }
let g:lightline.subseparator = {
            \   'left': '', 'right': '|'
            \ }

""" Powerline Separators
" let g:lightline.separator = {
"             \   'left': '', 'right': ''
"             \ }
" let g:lightline.subseparator = {
"             \   'left': '', 'right': ''
"             \ }

let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator

let g:lightline.enable = {
            \ 'statusline': 1,
            \ 'tabline': 0
            \ }

let g:lightline.tabline = {
            \ 'left': [ [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
            \ 'right': [ [ 'tabc' ], ],
            \ }

" """ Function to change tabline based on number of tabs
" function TabBuff()
"     if tabpagenr('$') > 1
"         let g:lightline.tabline = {
"                     \ 'left': [ [ 'tabs' ], ],
"                     \ 'right': [ [ 'tabc' ], ],
"                     \ }
"     else
"         let g:lightline.tabline = {
"                     \ 'left': [ [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
"                     \ 'right': [ [ 'tabc' ], ],
"                     \ }
"     endif
"     call lightline#enable()
" endfunction

""" Enabling Tabline
" set showtabline=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Lightline-Buffer Settings " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline_buffer_show_bufnr = 0   " Buffer Number
let g:lightline_buffer_excludes = ['vimfiler', 'fish']     " Hide from buffer list
" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'
"" Icons
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = ''
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '...'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = ' | '
" let g:lightline_buffer_separator_right_icon = '  | '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Lightline Functions " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Function to add Coc Support
function! s:lightline_coc_diagnostic(kind, sign) abort
    let info = get(b:, 'coc_diagnostic_info', 0)
    if empty(info) || get(info, a:kind, 0) == 0
        return ''
    endif
    return printf('%s %d', a:sign, info[a:kind])
endfunction
function! LightlineCocErrors() abort
    return s:lightline_coc_diagnostic('error', "\uf05e")
endfunction
function! LightlineCocWarnings() abort
    return s:lightline_coc_diagnostic('warning', "\uf071")
endfunction
function! LightlineCocInfos() abort
    return s:lightline_coc_diagnostic('information', "\uf129")
endfunction
function! LightlineCocHints() abort
    return s:lightline_coc_diagnostic('hints', 'H')
endfunction
autocmd User CocDiagnosticChange call lightline#update()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Vim Signify Hunks Support
function! StatuslineSignify()
    let [added, modified, removed] = sy#repo#get_stats()
    let l:sy = ''
    for [flag, flagcount] in [
                \   [exists("g:signify_sign_add")?g:signify_sign_add:'+', added],
                \   [exists("g:signify_sign_delete")?g:signify_sign_delete:'-', removed],
                \   [exists("g:signify_sign_change")?g:signify_sign_change:'!', modified]
                \ ]
        if flagcount> 0
            let l:sy .= printf('%s%d ', flag, flagcount)
        endif
    endfor
    if !empty(l:sy)
        let l:sy = printf('[ %s]', l:sy)
        let l:sy_vcs = get(b:sy, 'updated_by', '???')
        return printf('%s%s', l:sy_vcs, l:sy)
    else
        return ''
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Vim Fugitive Powerline Symbol
function! StatuslineFugitive()
    if exists('*FugitiveHead')
        let branch = FugitiveHead()
        return branch !=# '' ? '  '.branch : ''
    endif
    return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Show 'buffers' label when only one tab or current_tab/total_tabs count when more than 1 tab
function! Tabcount()
    if tabpagenr('$') > 1
        return 'tab  ' . tabpagenr() . '/' . tabpagenr('$')
    else
        return 'buffers'
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Read Only Symbol
function! StatuslineReadonly()
    return &readonly ? '' : ''
endfunction

""" Modified Symbol
function! StatuslineModified()
    return &modified ? '' : ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" VIM DEVICONS SUPPORT
""" Filetype Symbol
function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

" """ File Format(Unix) Symbol
" function! MyFileformat()
"   return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
" endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " END " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
