let g:ascii = [
            \'    ██████  ██░ ██  ▄▄▄       ███▄    █   ██████       ██▒   █▓ ██▓ ███▄ ▄███▓ ',
            \'  ▒██    ▒ ▓██░ ██▒▒████▄     ██ ▀█   █ ▒██    ▒      ▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ',
            \'  ░ ▓██▄   ▒██▀▀██░▒██  ▀█▄  ▓██  ▀█ ██▒░ ▓██▄         ▓██  █▒░▒██▒▓██    ▓██░ ',
            \'    ▒   ██▒░▓█ ░██ ░██▄▄▄▄██ ▓██▒  ▐▌██▒  ▒   ██▒       ▒██ █░░░██░▒██    ▒██  ',
            \'  ▒██████▒▒░▓█▒░██▓ ▓█   ▓██▒▒██░   ▓██░▒██████▒▒        ▒▀█░  ░██░▒██▒   ░██▒ ',
            \'  ▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒░   ▒ ▒ ▒ ▒▓▒ ▒ ░        ░ ▐░  ░▓  ░ ▒░   ░  ░ ',
            \'  ░ ░▒  ░ ░ ▒ ░▒░ ░  ▒   ▒▒ ░░ ░░   ░ ▒░░ ░▒  ░ ░        ░ ░░   ▒ ░░  ░      ░ ',
            \'  ░  ░  ░   ░  ░░ ░  ░   ▒      ░   ░ ░ ░  ░  ░            ░░   ▒ ░░      ░    ',
            \'        ░   ░  ░  ░      ░  ░         ░       ░             ░   ░         ░    ',
            \'                                                           ░                   ',
            \]

let g:startify_custom_header = g:ascii
let g:startify_session_dir = '~/.vim/sessions'

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

let g:startify_bookmarks = [
            \ { 'p': '~/.vim/plugins.vim' },
            \ { 'i': '~/.vim/init.vim' },
            \ { 'c': '~/.vim/plug-configs' },
            \ ]

let g:startify_enable_special = 0

" Keybinding
nnoremap <leader>st :Startify<CR>
