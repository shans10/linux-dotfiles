""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Plugins " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto-install vim-plug
if empty(glob('C:/Users/shant/AppData/Local/nvim/autoload/plug.vim'))
  silent !curl -fLo C:/Users/shant/AppData/Local/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('C:/Users/shant/nvim/plugged')
Plug 'tpope/vim-commentary',            { 'on': '<Plug>Commentary' }
Plug 'lambdalisue/suda.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-floaterm',           { 'on': [ 'FloatermToggle', 'FloatermNew' ] }
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree',              { 'on': [ 'NERDTreeCWD', 'NERDTreeToggle', 'NERDTreeFind' ] }
Plug 'gruvbox-community/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Sourcing the plugins configuration files
source C:/Users/shant/AppData/Local/nvim/plug-configs/startify.vim                     " startify
source C:/Users/shant/AppData/Local/nvim/plug-configs/vim-commentary.vim               " vim-commentary
source C:/Users/shant/AppData/Local/nvim/plug-configs/suda.vim                         " suda
source C:/Users/shant/AppData/Local/nvim/plug-configs/signify.vim                      " signify
source C:/Users/shant/AppData/Local/nvim/plug-configs/high-yank.vim                    " highlighted-yank
source C:/Users/shant/AppData/Local/nvim/plug-configs/gruvbox.vim                      " gruvbox
source C:/Users/shant/AppData/Local/nvim/plug-configs/quickscope.vim                   " quickscope
source C:/Users/shant/AppData/Local/nvim/plug-configs/sneak.vim                        " sneak
source C:/Users/shant/AppData/Local/nvim/plug-configs/floaterm.vim                     " floaterm
source C:/Users/shant/AppData/Local/nvim/plug-configs/airline.vim                      " airline
source C:/Users/shant/AppData/Local/nvim/plug-configs/nerdtree.vim                     " NERDTree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " END " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
