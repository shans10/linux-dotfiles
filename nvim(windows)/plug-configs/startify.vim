let g:ascii = [
            \'    ██████  ██░ ██  ▄▄▄       ███▄    █   ██████     ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ',
            \'  ▒██    ▒ ▓██░ ██▒▒████▄     ██ ▀█   █ ▒██    ▒     ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ',
            \'  ░ ▓██▄   ▒██▀▀██░▒██  ▀█▄  ▓██  ▀█ ██▒░ ▓██▄      ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ',
            \'    ▒   ██▒░▓█ ░██ ░██▄▄▄▄██ ▓██▒  ▐▌██▒  ▒   ██▒   ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ',
            \'  ▒██████▒▒░▓█▒░██▓ ▓█   ▓██▒▒██░   ▓██░▒██████▒▒   ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ',
            \'  ▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒░   ▒ ▒ ▒ ▒▓▒ ▒ ░   ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ',
            \'  ░ ░▒  ░ ░ ▒ ░▒░ ░  ▒   ▒▒ ░░ ░░   ░ ▒░░ ░▒  ░ ░   ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ',
            \'  ░  ░  ░   ░  ░░ ░  ░   ▒      ░   ░ ░ ░  ░  ░        ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ',
            \'        ░   ░  ░  ░      ░  ░         ░       ░              ░    ░  ░    ░ ░        ░   ░         ░    ',
            \'                                                                                    ░                   ',
            \]

let g:startify_custom_header = g:ascii
let g:startify_session_dir = 'C:/Users/shant/AppData/Local/nvim/sessions'

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction

let g:startify_bookmarks = [
            \ { 'p': 'C:/Users/shant/AppData/Local/nvim/plugins.vim' },
            \ { 'i': 'C:/Users/shant/AppData/Local/nvim/init.vim' },
            \ { 'c': 'C:/Users/shant/AppData/Local/nvim/plug-configs' },
            \ { 'x': 'D:/Programming/CS50X' },
            \ { 'a': 'D:/Programming/Algorithms' },
            \ { 'P': 'D:/Programming/Python' },
            \ ]

let g:startify_enable_special = 0

" Keybinding
nnoremap <leader>st :Startify<CR>