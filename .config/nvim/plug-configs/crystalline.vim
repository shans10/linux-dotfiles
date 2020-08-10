"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Crystalline " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.config/nvim/statusline_functions.vim

function! StatusLine(current, width)
    let l:s = ''

    if a:current
        let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
    else
        let l:s .= '%#CrystallineInactive#'
    endif
    let l:s .= ' %{StatuslineSignify()} %{StatuslineFugitive()} '
    if a:current
        let l:s .= crystalline#right_sep('', 'Fill') . ' %F%h%w%m%r '
    endif

    let l:s .= '%=' . ' %{&ft!=#""?&ft:"no ft"} '
    if a:current
        let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
        let l:s .= '%{&fenc!=#""?&fenc:&enc} | [%{&fileformat}] ' . crystalline#left_mode_sep('')
    endif
    if a:width > 80
        let l:s .= ' %3p%%   |   %l/%L : %-2v '
    else
        let l:s .= ' '
    endif

    return l:s
endfunction

function! TabLabel(buf, max_width) abort
    let [l:left, l:name, l:short_name, l:right] = crystalline#default_tablabel_parts(a:buf, a:max_width)
    return l:left . l:short_name . ' ' . (l:right ==# ' ' ? '' : ' ') . l:right
endfunction

function! TabLine() abort
    return crystalline#bufferline(0, 0, 1, 1, 'TabLabel', crystalline#default_tabwidth() + 3)
endfunction

let g:crystalline_enable_sep = 0
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'gruvbox'

"set showtabline=2
set guioptions-=e
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " END " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
