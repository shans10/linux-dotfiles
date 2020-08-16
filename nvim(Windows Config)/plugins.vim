""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Plugins " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto-install vim-plug
if empty(glob('~/AppData/Local/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/AppData/Local/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'neoclide/coc.nvim',               { 'branch': 'release' }
Plug 'tpope/vim-commentary',            { 'on': '<Plug>Commentary' }
Plug 'Yggdroot/LeaderF',                { 'do': '.\install.bat' }
Plug 'lambdalisue/suda.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-floaterm',           { 'on': [ 'FloatermToggle', 'FloatermNew' ] }
Plug 'vim-airline/vim-airline' ",         { 'on': [ 'AirlineToggle', 'AirlineRefresh' ] }
Plug 'preservim/nerdtree',              { 'on': [ 'NERDTreeCWD', 'NERDTreeToggle', 'NERDTreeFind' ] }
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree',                 { 'on': 'UndotreeToggle' }
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Sourcing the plugins configuration files

source ~/AppData/Local/nvim/plug-configs/startify.vim                     " startify
source ~/AppData/Local/nvim/plug-configs/vim-commentary.vim               " vim-commentary
source ~/AppData/Local/nvim/plug-configs/LeaderF.vim                      " LeaderF
source ~/AppData/Local/nvim/plug-configs/suda.vim                         " suda
source ~/AppData/Local/nvim/plug-configs/signify.vim                      " signify
source ~/AppData/Local/nvim/plug-configs/high-yank.vim                    " highlighted-yank
source ~/AppData/Local/nvim/plug-configs/undotree.vim                     " undotree
source ~/AppData/Local/nvim/plug-configs/gruvbox.vim                      " gruvbox
source ~/AppData/Local/nvim/plug-configs/quickscope.vim                   " quickscope
source ~/AppData/Local/nvim/plug-configs/sneak.vim                        " sneak
source ~/AppData/Local/nvim/plug-configs/floaterm.vim                     " floaterm
source ~/AppData/Local/nvim/plug-configs/coc.vim                          " coc
source ~/AppData/Local/nvim/plug-configs/airline.vim                      " airline
source ~/AppData/Local/nvim/plug-configs/nerdtree.vim                     " NERDTree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " END " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
