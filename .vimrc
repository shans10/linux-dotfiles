" Plugins
source ~/.vim/plugins.vim

" Keybindings
" source ~/.vim/keybindings.vim

" Encoding
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8

" Colorscheme
colorscheme gruvbox
set background=dark
set termguicolors

" Relative line numbers
set number relativenumber

" Leader Key
map <Space> <Leader>

" Clipboard
set clipboard+=unnamedplus
let g:clipboard = {
            \	'name': 'win32yank-wsl',
            \	'copy': {
            \	    '+': 'win32yank.exe -i --crlf',
            \	    '*': 'win32yank.exe -i --crlf',
            \	},
            \	'paste': {
            \	    '+': 'win32yank.exe -o --lf',
            \	    '*': 'win32yank.exe -o --lf',
            \	},
            \	'cache_enabled': 0,
            \}

" Indentation
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nowrap
set autoindent
set cindent

" Swap and Backup
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

set autochdir
set nocompatible
filetype plugin indent on

" Commandline Completion
set wildmenu

" Split Below/Right
set splitbelow
set splitright

" Left/Right Navigation Change Line
set whichwrap+=<,>,[,]

" Highlight the line on which the cursor lives.
set nocursorline

" Always show at least one line above/below the cursor.
set scrolloff=1
" Always show at least one line left/right of the cursor.
set sidescrolloff=5

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Remove timeout for partially typed commands
set notimeout

" If lightline/airline is enabled, don't show mode under it
set noshowmode

" Allow switching buffers without saving
set hidden

" Mouse Support
set mouse=a

" Searching
" Case insensitive searching
set ignorecase
" Automatically switch to case sensitive if you use any capitals
set smartcase

" netrw configuration
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_banner = 0
let g:netrw_winsize = 21
let g:netrw_altfile = 1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist

" Always Enter Terminal Buffer in Insert Mode
" For Split Term opened with a shortcut
autocmd BufWinEnter,WinEnter term://* startinsert

" Auto toggle smart case of for ex commands
" Assumes 'set ignorecase smartcase'
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

" Restore last cursor position and marks on open
au BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif

" Make ci( work like quotes do
function! New_cib()
    if search("(","bn") == line(".")
        sil exe "normal! f)ci("
        sil exe "normal! l"
        startinsert
    else
        sil exe "normal! f(ci("
        sil exe "normal! l"
        startinsert
    endif
endfunction

" And for curly brackets
function! New_ciB()
    if search("{","bn") == line(".")
        sil exe "normal! f}ci{"
        sil exe "normal! l"
        startinsert
    else
        sil exe "normal! f{ci{"
        sil exe "normal! l"
        startinsert
    endif
endfunction

nnoremap ci( :call New_cib()<CR>
nnoremap cib :call New_cib()<CR>
nnoremap ci{ :call New_ciB()<CR>
nnoremap ciB :call New_ciB()<CR>

" Trim Whitespaces
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " END " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
