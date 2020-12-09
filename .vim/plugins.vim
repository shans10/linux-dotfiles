call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary',            { 'on': '<Plug>Commentary' }
Plug 'lambdalisue/suda.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree',              { 'on': [ 'NERDTreeCWD', 'NERDTreeToggle', 'NERDTreeFind' ] }
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Sourcing the plugins configuration files

source ~/.vim/plug-configs/startify.vim                     " startify
source ~/.vim/plug-configs/vim-commentary.vim               " vim-commentary
source ~/.vim/plug-configs/suda.vim                         " suda
source ~/.vim/plug-configs/high-yank.vim                    " highlighted-yank
source ~/.vim/plug-configs/gruvbox.vim                      " gruvbox
source ~/.vim/plug-configs/airline.vim                      " airline
source ~/.vim/plug-configs/nerdtree.vim                     " NERDTree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " END " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
