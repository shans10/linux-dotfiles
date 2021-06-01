""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Plugins " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim',               {'branch': 'release'}
Plug 'tpope/vim-commentary',            { 'on': '<Plug>Commentary' }
Plug 'junegunn/fzf',                    { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',
Plug 'lambdalisue/suda.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-floaterm',           { 'on': [ 'FloatermToggle', 'FloatermNew' ] }
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree',              { 'on': [ 'NERDTreeCWD', 'NERDTreeToggle', 'NERDTreeFind' ] }
Plug 'gruvbox-community/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree',                 { 'on': 'UndotreeToggle' }
Plug 'rrethy/vim-hexokinase',           { 'do': 'make hexokinase' }
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Sourcing the plugins configuration files

source ~/.config/nvim/plug-configs/coc.vim                          " coc
source ~/.config/nvim/plug-configs/startify.vim                     " startify
source ~/.config/nvim/plug-configs/vim-commentary.vim               " vim-commentary
source ~/.config/nvim/plug-configs/fzf.vim                          " fzf
source ~/.config/nvim/plug-configs/suda.vim                         " suda
source ~/.config/nvim/plug-configs/signify.vim                      " signify
source ~/.config/nvim/plug-configs/hexokinase.vim                   " hexokinase
source ~/.config/nvim/plug-configs/high-yank.vim                    " highlighted-yank
source ~/.config/nvim/plug-configs/undotree.vim                     " undotree
source ~/.config/nvim/plug-configs/gruvbox.vim                      " gruvbox
source ~/.config/nvim/plug-configs/quickscope.vim                   " quickscope
source ~/.config/nvim/plug-configs/sneak.vim                        " sneak
source ~/.config/nvim/plug-configs/floaterm.vim                     " floaterm
source ~/.config/nvim/plug-configs/airline.vim                      " airline
source ~/.config/nvim/plug-configs/nerdtree.vim                     " NERDTree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " END " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
